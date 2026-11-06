local home = os.getenv("HOME")
local dir = home .. "/.config/rex/sessions"
local shell = "com.superlogical.terminal.shell"

local function expand(path)
  if path == nil then return nil end
  return (path:gsub("^~", home))
end

local function slug(label)
  local s = label:lower()
  s = s:gsub("å", "a"):gsub("ä", "a"):gsub("ö", "o")
  s = s:gsub("[^a-z0-9]+", "_"):gsub("^_+", ""):gsub("_+$", "")
  return s
end

local function pane(spec, cwd)
  return {
    block = {
      flavor  = shell,
      label   = spec.name,
      options = { command = spec.command, cwd = expand(spec.cwd) or cwd },
    },
  }
end

local function tab_layout(tab, cwd)
  if not tab.panes then return pane(tab, cwd) end
  local tab_cwd = expand(tab.cwd) or cwd
  local node = pane(tab.panes[#tab.panes], tab_cwd)
  for i = #tab.panes - 1, 1, -1 do
    node = {
      split = {
        direction = (tab.split == "right") and "horizontal" or "vertical",
        ratio     = tab.ratio,
        before    = pane(tab.panes[i], tab_cwd),
        after     = node,
      },
    }
  end
  return node
end

local function find_session(label)
  local r, err = rex.call("session.list", {})
  if err ~= nil then error(err, 0) end
  for _, s in ipairs(r.sessions or {}) do
    if s.label == label then return s.session_id end
  end
end

local function start(spec)
  local id = find_session(spec.label)
  if id == nil then
    local cwd = expand(spec.cwd)
    local windows = {}
    for _, tab in ipairs(spec.tabs or { {} }) do
      table.insert(windows, { window_label = tab.name, layout = tab_layout(tab, cwd) })
    end
    local r, err = rex.call("session.create", { label = spec.label, initial_windows = windows })
    if err ~= nil then error(err, 0) end
    id = r.session_id
    for i, tab in ipairs(spec.tabs or {}) do
      local w = r.initial_windows and r.initial_windows[i]
      if tab.active and w then
        rex.call("session.attach", { session_id = id })
        local _, ferr = rex.call("session.focus_window", { session_id = id, window_id = w.window_id })
        if ferr ~= nil then error("focus_window: " .. tostring(ferr), 0) end
        rex.client.queue("session.select", { session_id = id, window_id = w.window_id })
        return { session_id = id, window_id = w.window_id }
      end
    end
  end
  rex.client.queue("session.select", { session_id = id })
  return { session_id = id }
end

local ls = rex.exec({ "ls", dir })
if ls == nil or not ls.ok then return end

for file in ls.stdout:gmatch("[^\n]+") do
  if file:match("%.lua$") then
    local ok, spec = pcall(dofile, dir .. "/" .. file)
    if not ok or type(spec) ~= "table" or not spec.label then
      rex.log("sessions: skipping " .. file .. ": " .. tostring(spec))
    else
      rex.action{
        name     = "session_" .. slug(spec.label),
        title    = "Start Session: " .. spec.label,
        category = "Sessions",
        keywords = "session start quickstart " .. spec.label,
        run      = function() return start(spec) end,
      }
    end
  end
end
