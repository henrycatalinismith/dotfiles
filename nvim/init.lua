-- Turn off syntax autoloading
--
-- Leaves syntax highlighting
-- enabled but switches off
-- automatic loading of
-- language-specific syntax
-- rules.
--
-- Grammar-aware highlighting
-- that knows about keywords
-- and syntax errors and so on
-- is nice but dependency-heavy
-- and brittle. Manual syntax
-- isn't as impressive to look
-- at but it works the same in
-- every language with zero
-- setup or dependencies.
vim.api.nvim_command("syntax manual")

-- Disable remote plugins
--
-- These aren't particularly
-- useful and they depend on
-- having packages installed
-- for each language. If those
-- packages are missing you get
-- unwanted :checkhealth noise.
vim.g.loaded_node_provider = false
vim.g.loaded_perl_provider = false
vim.g.loaded_ruby_provider = false

-- Use space as the leader key
--
-- Space is the biggest key on
-- a standard keyboard and
-- doesn't do anything by
-- default in normal mode.
vim.g.mapleader = " "

-- Most intuitive wildmenu
--
-- Always show the list of
-- matches if there is one and
-- choose the longest match.
vim.g.wildmode = "longest:list"

-- Highlight the cursor line
--
-- Even if the whole line
-- isn't being highlighted it's
-- useful to at least highlight
-- the current line number.
vim.o.cursorline = true

-- Default to spaces, not tabs
--
-- Indentation using spaces is
-- more ubiquitous than tabs so
-- this is a better starting
-- point.
vim.o.expandtab = true

-- 1 space indents by default
--
-- This is intentionally small
-- in order to optimize for
-- shorter lines. Code that fits
-- in a narrow column is more
-- legible in space-constrained
-- contexts like mobile devices,
-- refreshable braille displays,
-- and split diffs.
vim.o.shiftwidth = 1

-- Line numbers up to 9999
--
-- Setting a wide column for the
-- line numbers minimizes UI
-- movement when file lengths
-- change.
vim.o.number = true
vim.o.numberwidth = 4

-- Max out the signcolumn
--
-- Using both available columns
-- for this allows for a little
-- bit of whitespace between an
-- icon and the left of the
-- window.
vim.o.signcolumn = "yes:2"

-- Terminal colors on
--
-- Without this none of the
-- colors work properly in the
-- terminal.
vim.o.termguicolors = true

-- Create normal mode keymap
function nmap(lhs, rhs)
 vim.api.nvim_set_keymap(
  "n",
  lhs,
  rhs,
  { noremap = true }
 )
end

nmap("<leader>q", ":quit!<CR>")
nmap("<leader>t", ":tabnew<CR>")
nmap("<leader>w", ":write<CR>")

-- Remove all highlights
--
-- This function resets all
-- highlight rules back to
-- zero. It removes all default
-- foreground and background
-- colors, and also removes all
-- links between highlight
-- groups.
function hireset()

 -- Enumerate default highlights
 --
 -- The table produced looks
 -- like this: {
 --  "SpecialKey     xxx ctermfg=81 guifg=Cyan",
 --  "EndOfBuffer    xxx links to NonText",
 --  "TermCursor     xxx cterm=reverse gui=reverse",
 --  "TermCursorNC   xxx cleared",
 --  "NonText        xxx ctermfg=12 gui=bold guifg=Blue",
 --  "Directory      xxx ctermfg=159 guifg=Cyan",
 --  "ErrorMsg       xxx ctermfg=15 ctermbg=1 guifg=White guibg=Red",
 -- }
 local highlight_groups = vim.split(
  vim.api.nvim_command_output("hi"),
  "\n"
 )

 for i,line in pairs(highlight_groups) do
  -- Extracts the first word:
  -- line: "Pmenu          xxx ctermfg=0 ctermbg=13 guibg=Magenta"
  -- group: "Pmenu"
  local group = string.match(line, "%w+")

  -- Lines with = signs in them
  -- set colors. For example:
  -- "ErrorMsg       xxx ctermfg=15 ctermbg=1 guifg=White guibg=Red",
  local is_color = string.match(line, "=") ~= nil

  -- Lines containing "links to"
  -- link one group to another,
  -- For example:
  -- "EndOfBuffer    xxx links to NonText",
  local is_link = string.match(line, "links to") ~= nil

  if is_color then
   vim.api.nvim_command(
    string.format(
     "highlight clear %s",
     group
    )
   )
  elseif is_link then
   vim.api.nvim_command(
    string.format(
     "highlight link %s NONE",
     group
    )
   )
  end
 end
end

hireset()

local colors = {
 aliceblue = "#F0F8FF",
 amethyst = "#9966CC",
 antiquewhite = "#FAEBD7",
 aqua = "#00FFFF",
 aquamarine = "#7FFFD4",
 azure = "#F0FFFF",
 beige = "#F5F5DC",
 bisque = "#FFE4C4",
 black = "#000000",
 blanchedalmond = "#FFEBCD",
 blue = "#0000FF",
 blueviolet = "#8A2BE2",
 brown = "#A52A2A",
 burlywood = "#DEB887",
 cadetblue = "#5F9EA0",
 chartreuse = "#7FFF00",
 chocolate = "#D2691E",
 coral = "#FF7F50",
 cornflowerblue = "#6495ED",
 cornsilk = "#FFF8DC",
 crimson = "#DC143C",
 cyan = "#00FFFF",
 darkblue = "#00008B",
 darkcyan = "#008B8B",
 darkgoldenrod = "#B8860B",
 darkgray = "#A9A9A9",
 darkgreen = "#006400",
 darkkhaki = "#BDB76B",
 darkmagenta = "#8B008B",
 darkolivegreen = "#556B2F",
 darkorange = "#FF8C00",
 darkorchid = "#9932CC",
 darkred = "#8B0000",
 darksalmon = "#E9967A",
 darkseagreen = "#8FBC8F",
 darkslateblue = "#483D8B",
 darkslategray = "#2F4F4F",
 darkturquoise = "#00CED1",
 darkviolet = "#9400D3",
 deeppink = "#FF1493",
 deepskyblue = "#00BFFF",
 dimgray = "#696969",
 dodgerblue = "#1E90FF",
 firebrick = "#B22222",
 floralwhite = "#FFFAF0",
 forestgreen = "#228B22",
 fuchsia = "#FF00FF",
 gainsboro = "#DCDCDC",
 ghostwhite = "#F8F8FF",
 gold = "#FFD700",
 goldenrod = "#DAA520",
 gray = "#808080",
 green = "#008000",
 greenyellow = "#ADFF2F",
 honeydew = "#F0FFF0",
 hotpink = "#FF69B4",
 indianred = "#CD5C5C",
 indigo = "#4B0082",
 ivory = "#FFFFF0",
 khaki = "#F0E68C",
 lavender = "#E6E6FA",
 lavenderblush = "#FFF0F5",
 lawngreen = "#7CFC00",
 lemonchiffon = "#FFFACD",
 lightblue = "#ADD8E6",
 lightcoral = "#F08080",
 lightcyan = "#E0FFFF",
 lightgoldenrodyellow = "#FAFAD2",
 lightgreen = "#90EE90",
 lightgrey = "#D3D3D3",
 lightpink = "#FFB6C1",
 lightsalmon = "#FFA07A",
 lightsalmon = "#FFA07A",
 lightseagreen = "#20B2AA",
 lightskyblue = "#87CEFA",
 lightslategray = "#778899",
 lightsteelblue = "#B0C4DE",
 lightyellow = "#FFFFE0",
 lime = "#00FF00",
 limegreen = "#32CD32",
 linen = "#FAF0E6",
 magenta = "#FF00FF",
 maroon = "#800000",
 mediumaquamarine = "#66CDAA",
 mediumblue = "#0000CD",
 mediumorchid = "#BA55D3",
 mediumpurple = "#9370DB",
 mediumseagreen = "#3CB371",
 mediumslateblue = "#7B68EE",
 mediumslateblue = "#7B68EE",
 mediumspringgreen = "#00FA9A",
 mediumturquoise = "#48D1CC",
 mediumvioletred = "#C71585",
 midnightblue = "#191970",
 mintcream = "#F5FFFA",
 mistyrose = "#FFE4E1",
 moccasin = "#FFE4B5",
 navajowhite = "#FFDEAD",
 navy = "#000080",
 oldlace = "#FDF5E6",
 olive = "#808000",
 olivedrab = "#6B8E23",
 orange = "#FFA500",
 orangered = "#FF4500",
 orchid = "#DA70D6",
 palegoldenrod = "#EEE8AA",
 palegreen = "#98FB98",
 paleturquoise = "#AFEEEE",
 palevioletred = "#DB7093",
 papayawhip = "#FFEFD5",
 peachpuff = "#FFDAB9",
 peru = "#CD853F",
 pink = "#FFC0CB",
 plum = "#DDA0DD",
 powderblue = "#B0E0E6",
 purple = "#800080",
 red = "#FF0000",
 rosybrown = "#BC8F8F",
 royalblue = "#4169E1",
 saddlebrown = "#8B4513",
 salmon = "#FA8072",
 sandybrown = "#F4A460",
 seagreen = "#2E8B57",
 seashell = "#FFF5EE",
 sienna = "#A0522D",
 silver = "#C0C0C0",
 skyblue = "#87CEEB",
 slateblue = "#6A5ACD",
 slategray = "#708090",
 snow = "#FFFAFA",
 springgreen = "#00FF7F",
 steelblue = "#4682B4",
 tan = "#D2B48C",
 teal = "#008080",
 thistle = "#D8BFD8",
 tomato = "#FF6347",
 turquoise = "#40E0D0",
 violet = "#EE82EE",
 wheat = "#F5DEB3",
 white = "#FFFFFF",
 whitesmoke = "#F5F5F5",
 yellow = "#FFFF00",
 yellowgreen = "#9ACD32",
}

-- Add a highlight group
--
-- Example commands:
-- :highlight Normal guibg=#FFFAFA
-- :highlight String guifg=#FF1493
function hi(group, name, value)
 vim.api.nvim_command(
  string.format(
   "highlight %s %s=%s",
   group,
   name,
   value
  )
 )
end

-- Highlight background color
--
-- :highlight Normal guibg=#FFFAFA
function bg(group, color)
 hi(group, "guibg", color)
end

-- Highlight foreground color
--
-- :highlight String guifg=#FF1493
function fg(group, color)
 hi(group, "guifg", color)
end

function syntax(group, symbols)
 for i = 1,#symbols do
  vim.api.nvim_command(
   string.format(
    'au BufEnter * syntax match %s "%s"',
    group,
    symbols[i]
   )
  )
 end
end

syntax("Bracket", {
 "(", ")",
 "{", "}",
 "\\[", "\\]",
 "<", ">",
})


vim.cmd([[au BufEnter * syntax match Number /\d\+/]])
vim.cmd([[au BufEnter * syntax match Number /[0-9a-fA-F]\{6\}/]])

syntax("Math", {
 "+", "-", "=", "*", "/", "~=", "!=",
 ",", "\\.", ":", ";"
})

syntax("String", {
 '\\".*\\"',
})


function highlight_group()
 local pos = vim.api.nvim_win_get_cursor(0)
 local line = pos[1]
 local col = pos[2] + 1
 local synID = vim.fn.synID
 local synIDattr = vim.fn.synIDattr
 local synIDtrans = vim.fn.synIDtrans

 local hi = synIDattr(synID(line, col, true), "name")
 local trans = synIDattr(synID(line, col, false), "name")
 local lo = synIDattr(synIDtrans(synID(line, col, true)), "name")

 local groups = {}
 if hi and hi ~= "" then
  table.insert(groups, string.format("[%s]", hi))
 end
 if trans and trans ~= "" and trans ~= hi then
  table.insert(groups, string.format("[%s]", trans))
 end
 if lo and lo ~= "" and lo ~= trans and lo ~= hi then
  table.insert(groups, string.format("[%s]", lo))
 end
 return table.concat(groups, "")
end

function lol()
 return "lol"
end


local statusline_parts = {
 "%#StatusLine#",
 "%=",
 "%=",
 "%{%v:lua.highlight_group()%}",
 "%#StatusLine#",
 "%y%h%w%m%r",
 "[%-3l,%-03c]",
 "[%{%v:lua.vim.api.nvim_get_mode().mode%}]\\ ",
}


local statusline_cmd = string.format(
 "set statusline=%s",
 table.concat(statusline_parts, "")
)

vim.api.nvim_command(statusline_cmd)

vim.opt.matchpairs:append "（:）"
vim.opt.matchpairs:append "「:」"
vim.opt.matchpairs:append "｛:｝"
vim.opt.matchpairs:append "＜:＞"
vim.opt.matchpairs:append "【:】"
vim.opt.matchpairs:append "『:』"
vim.opt.matchpairs:append "［:］"
vim.opt.matchpairs:append "《:》"
vim.opt.matchpairs:append "〔:〕"
vim.opt.matchpairs:append "‘:’"
vim.opt.matchpairs:append "“:”"
vim.opt.matchpairs:append "«:»"
vim.opt.matchpairs:append "‹:›"
vim.opt.matchpairs:append "｢:｣"
vim.opt.matchpairs:append "[:]"
vim.opt.matchpairs:append "<:>"
vim.opt.matchpairs:append "`:`"

function tabline()
 local cur = vim.fn.tabpagenr()
 local max = vim.fn.tabpagenr("$")

 local parts = {
  "%=",
 }

 for i = 1,max do
  local bufnr = vim.fn.tabpagebuflist(i)[vim.fn.tabpagewinnr(i)]
  local file = vim.fn.bufname(bufnr)
  local name = "No name"
  if file:match("^.+/(.+)$") ~= nil then
   name = file:match("^.+/(.+)$")
  elseif file ~= nil and file ~= "" then
   name = file
  end

  name = string.format(
   " %s ",
   name
  )

  local iscur = i == cur
  local group = "TabLine"
  if iscur then
   group = "TabLineSel"
  end

  local tab = {}
  table.insert(tab, "%#")
  table.insert(tab, group)
  table.insert(tab, "#")
  table.insert(tab, name)
  table.insert(tab, "")
  table.insert(parts, table.concat(tab, ""))
 end

 local line = table.concat(parts, " ") .. " "
 return line
end

vim.o.showtabline = 2
vim.o.tabline = "%!v:lua.tabline()"

vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
 pattern = {
  "*.html",
 },
 callback = function()
  vim.api.nvim_command("syntax clear Comment")
  vim.api.nvim_command([[syntax match Comment "--.*$"]])
  vim.api.nvim_command([[syntax region Comment start=+<!--+ end=+--\s*>+]])
 end,
 group = vim.api.nvim_create_augroup("html", {
  clear = false,
 }),
})

vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
 pattern = {
  "*.lua",
 },
 callback = function()
  vim.api.nvim_command("syntax clear Comment")
  vim.api.nvim_command([[syntax match Comment "--.*$"]])
 end,
 group = vim.api.nvim_create_augroup("lua", {
  clear = false,
 }),
})

vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
 pattern = {
  "*.css",
 },
 callback = function()
  vim.api.nvim_command("syntax clear Comment")
  vim.api.nvim_command([[syntax region Comment start="/\*" end="\*/"]])
 end,
 group = vim.api.nvim_create_augroup("css", {
  clear = false,
 }),
})

vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
 pattern = {
  "*.py",
  "*.rb",
  "*.sh",
  "*.yaml",
  "*.yml",
  "*.zsh",
  "Makefile",
  "makefile",
 },
 callback = function()
  vim.api.nvim_command("syntax clear Comment")
  vim.api.nvim_command([[syntax match Comment "#.*$"]])
 end,
 group = vim.api.nvim_create_augroup("ruby", {
  clear = false,
 }),
})

vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
 pattern = {
   "*.c",
   "*.cpp",
   "*.dart",
   "*.java",
   "*.js",
   "*.jsx",
   "*.php",
   "*.scss",
   "*.ts",
   "*.tsx",
 },
 callback = function()
  vim.api.nvim_command("syntax clear Comment")
  vim.api.nvim_command([[syntax match Comment "\/\/.*"]])
  vim.api.nvim_command([[syntax region Comment start="/\*" end="\*/"]])
 end,
 group = vim.api.nvim_create_augroup("c++", {
  clear = false,
 }),
})

bg("Cursor", colors.deeppink)
bg("IncSearch", colors.yellow)
bg("Normal", colors.snow)
bg("NormalFloat", colors.darkslategray)
bg("PMenu", colors.darkslategray)
bg("PMenuSel", colors.deeppink)
bg("PMenuThumb", colors.slategray)
bg("PmenuSbar", colors.lightgrey)
bg("Search", colors.yellow)
bg("StatusLine", colors.lavender)
bg("Visual", colors.lightskyblue)

fg("Bracket", colors.tomato)
fg("Comment", colors.dodgerblue)
fg("Cursor", colors.deeppink)
fg("CursorLineNR", colors.deeppink)
fg("EndOfBuffer", colors.snow)
fg("LineNr", colors.thistle)
fg("Math", colors.dodgerblue)
fg("MsgArea", colors.darkslategray)
fg("Normal", colors.darkslategray)
fg("NormalFloat", colors.snow)
fg("Number", colors.magenta)
fg("PMenu", colors.snow)
fg("PMenuSel", colors.snow)
fg("SignColumn", colors.deeppink)
fg("StatusLine", colors.darkslategray)
fg("String", colors.deeppink)
fg("TabLine", colors.thistle)
fg("TabLineFill", colors.snow)
fg("TabLineSel", colors.deeppink)

