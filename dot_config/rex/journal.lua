local home = os.getenv("HOME")

rex.action{
  name     = "journal",
  title    = "Journal: New Entry",
  keywords = "jot note diary",
  run      = function(ctx, args)
    local _, err = rex.session.new_layer{
      bounds = { 0.15, 0.15, 0.7, 0.6 },
      focus  = true,
      layout = rex.layout.block{
        flavor  = "com.superlogical.terminal.shell",
        label   = "journal",
        options = { command = { home .. "/journal/append/target/release/jot" }, cwd = home .. "/journal" },
      },
    }
    if err ~= nil then error(err, 0) end
  end,
}

rex.bind("cmd+ctrl+j", "journal")

local terminal = "com.superlogical.terminal"

local function session_label(id)
  local r = rex.call("session.list", {})
  for _, s in ipairs(r and r.sessions or {}) do
    if s.session_id == id then return s.label end
  end
end

-- format returns the whole scrollback; only the tail is needed for the visible screen.
local function screen_text(block_id, rows, cols)
  local budget = rows * (cols * 4 + 1) + 4096
  local first, err = rex.block.call(terminal, "format", { block_id = block_id, format = "text", trim = true, max_bytes = budget })
  if err ~= nil then error(err, 0) end
  local text = first.content
  if first.id ~= nil and not first.eof then
    local offset = math.max(0, first.total - budget)
    local parts = {}
    while true do
      local chunk, cerr = rex.block.call(terminal, "blob_read", { block_id = block_id, id = first.id, offset = offset })
      if cerr ~= nil then error(cerr, 0) end
      table.insert(parts, chunk.data)
      if chunk.eof or #chunk.data == 0 then break end
      offset = offset + #chunk.data
    end
    text = table.concat(parts)
  end

  local lines = {}
  for line in (text .. "\n"):gmatch("([^\n]*)\n") do table.insert(lines, line) end
  while #lines > 0 and lines[#lines] == "" do table.remove(lines) end
  local from = math.max(1, #lines - rows + 1)
  return table.concat(lines, "\n", from)
end

local function toast(session_id, message)
  local layer, err = rex.session.new_layer{
    bounds = { 0.68, 0.02, 0.3, 0.08 },
    focus  = false,
    layout = rex.layout.block{
      flavor  = "com.superlogical.terminal.shell",
      label   = "journal",
      options = { command = { "sh", "-c", "printf '\\033[?25l %s' \"$1\"; exec sleep 5", "toast", message } },
    },
  }
  if err ~= nil then error(err, 0) end
  local args = string.format('{"session_id":"%s","layer_id":"%s"}', session_id, layer.layer_id)
  rex.exec({ "sh", "-c", 'nohup sh -c \'sleep 1; rex api call session.close_layer "$0"\' "$1" >/dev/null 2>&1 &', "sh", args })
end

rex.action{
  name     = "journal_toast",
  title    = "Journal: Toast",
  run      = function(ctx, args)
    toast(ctx.session_id, args.message or "hello")
  end,
}

rex.action{
  name     = "journal_screenshot",
  title    = "Journal: Screenshot Pane",
  keywords = "jot capture snapshot",
  run      = function(ctx, args)
    local size, err = rex.block.call(terminal, "size", { block_id = ctx.block_id })
    if err ~= nil then error(err, 0) end
    local screen = screen_text(ctx.block_id, size.rows, size.columns)
    local r, xerr = rex.exec(
      { home .. "/journal/append/target/release/jot", "--screenshot" },
      { stdin = screen, env = { JOT_SESSION_NAME = session_label(ctx.session_id) or false } }
    )
    if xerr ~= nil then error(xerr, 0) end
    if not r.ok then error("jot: " .. r.stderr, 0) end
    local path = r.stdout:gsub("%s+$", "")
    if path ~= "" then
      toast(ctx.session_id, "Screenshot saved in " .. path:gsub("^" .. home:gsub("%p", "%%%0"), "~"))
    end
  end,
}

rex.bind("cmd+ctrl+3", "journal_screenshot")
