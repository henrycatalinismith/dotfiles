vim.api.nvim_command("syntax manual")

vim.g.mapleader = " "
vim.g.wildmode = "longest:list,full"
vim.g.wildoptions = "pum"

vim.o.cursorcolumn = true
vim.o.cursorline = true
vim.o.expandtab = true
vim.o.incsearch = true
vim.o.hlsearch = true
vim.o.mouse = "a"
vim.o.scrolloff = 8
vim.o.shiftwidth = 1
vim.o.signcolumn = "yes:1"
vim.o.termguicolors = true

vim.wo.number = true
vim.wo.numberwidth = 5
vim.wo.fillchars = "eob: "

vim.api.nvim_set_keymap(
 "n",
 "<leader>q",
 ":quit!<CR>",
 { noremap = true }
)

vim.api.nvim_set_keymap(
 "n",
 "<leader>w",
 ":write<CR>",
 { noremap = true }
)

local highlight_groups = vim.split(
 vim.api.nvim_command_output("hi"),
 "\n"
)

for i = 1,#highlight_groups do
 local line = highlight_groups[i]
 local group = string.match(line, "%w+")

 if string.match(line, "=") ~= nil then
  vim.api.nvim_command(
   string.format(
    "highlight clear %s",
    group
   )
  )
 elseif string.match(line, "links to") ~= nil then
  vim.api.nvim_command(
   string.format(
    "highlight link %s NONE",
    group
   )
  )
 end

end

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

function kmap(tbl, f)
 local t = {}
 for k,v in pairs(tbl) do
  t[#t + 1] = f(k, v)
 end
 return t
end

function merge(a, b)
 local c = {}
 for k,v in pairs(a) do c[k] = v end
 for k,v in pairs(b) do c[k] = v end
 return c
end

function hi(group, properties)
 vim.api.nvim_command(string.format(
  "highlight %s %s",
  group,
  table.concat(
   kmap(
    properties,
    function(k, v)
     return string.format("%s=%s", k, v)
    end
   ),
   " "
  )
 ))
end

function bg(name, color, extras)
 hi(
  name,
  merge({
   guibg = color
  }, extras or {})
 )
end

function fg(name, color, extras)
 hi(
  name,
  merge({
   guifg = color
  }, extras or {})
 )
end

fg("Normal", colors.darkslategray)
bg("Normal", colors.snow)

bg("PMenu", colors.darkslategray)
fg("PMenu", colors.snow)

bg("Visual", colors.lightskyblue)

bg("NormalFloat", colors.darkslategray)
fg("NormalFloat", colors.snow)

bg("PMenuSel", colors.deeppink)
fg("PMenuSel", colors.snow)

bg("PmenuSbar", colors.lightgrey)
bg("PMenuThumb", colors.slategray)

fg("LineNr", colors.thistle)

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

fg("Bracket", colors.tomato)

vim.cmd([[au BufEnter * syntax match Number /\d\+/]])
vim.cmd([[au BufEnter * syntax match Number /[0-9a-fA-F]\{6\}/]])
fg("Number", colors.magenta)

syntax("Math", {
 "+", "-", "=", "*", "/", "~=", "!=",
 ",", "\\.", ":", ";"
})

syntax("String", {
 '\\".*\\"',
})

fg("Math", colors.dodgerblue)

fg("String", colors.deeppink)
bg("IncSearch", colors.yellow)
bg("Search", colors.yellow)

local crosshair = colors.lavenderblush
bg("CursorColumn", crosshair)
bg("CursorLine", crosshair)
bg("CursorLineNR", crosshair)
bg("CursorLineSign", crosshair)

fg("CursorLineNR", colors.deeppink)

fg("Cursor", colors.deeppink)
bg("Cursor", colors.deeppink)

bg("StatusLine", colors.lavender)
bg("SignColumn", colors.whitesmoke)

bg("TabLineSel", colors.snow)
fg("TabLineSel", colors.deeppink)

bg("TabLine", colors.whitesmoke)
bg("TabLineFill", colors.whitesmoke)

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

local statusline_parts = {}
table.insert(statusline_parts, "\\ %t")
table.insert(statusline_parts, "\\ [%{%v:lua.vim.api.nvim_get_mode().mode%}]")
table.insert(statusline_parts, "%y%h%w%m%r")
table.insert(statusline_parts, "%=\\ ")
table.insert(statusline_parts, "%{%v:lua.highlight_group()%}")
table.insert(statusline_parts, "[%l,%c]\\ ")

local statusline_cmd = string.format(
 "set statusline=%s",
 table.concat(statusline_parts, "")
)

--vim.api.nvim_command("set statusline=%f\\ %h%w%m%r\\ %=%{%v:lua.highlight_group()%}\\ %(%l,%c%V\\ %=\\ %P%)")
--vim.api.nvim_command("set statusline=%{%v:lua.vim.api.nvim()%}\\ %{%v:lua.highlight_group()%}")
vim.api.nvim_command(statusline_cmd)

--vim.cmd([[autocmd BufWritePost init.lua luafile %]])

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

-- vim.cmd([[
--  augroup fold
--   au BufReadPre * setlocal foldmethod=indent
--   au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
--  augroup END
-- ]], "")
--

function buffer_is_valid(buf_num)
 if not buf_num or buf_num < 1 then return false end
 local exists = vim.api.nvim_buf_is_valid(buf_num)
 return vim.bo[buf_num].buflisted and exists
end

function get_valid_buffers()
 return vim.tbl_filter(buffer_is_valid, vim.api.nvim_list_bufs())
end

bg("Buffer", colors.snow)
fg("Buffer", colors.darkslategray)

bg("BufferSel", colors.snow)
fg("BufferSel", colors.deeppink)

fg("BufferLineFill", colors.snow)

function tabline()
 local parts = {
  "%#SignColumn#  ",
  "%#LineNr#    ",
 }

 local buffers = get_valid_buffers()
 for i, buf_id in ipairs(buffers) do
  local name = vim.api.nvim_buf_get_name(buf_id)
  local iscur = vim.api.nvim_get_current_buf() == buf_id
  local group = "Buffer"
  if iscur then
   group = "BufferSel"
  end
  name = name:match("^.+/(.+)$")
  local buffer = {}
  table.insert(buffer, "%#")
  table.insert(buffer, group)
  table.insert(buffer, "# ")
  table.insert(buffer, name)
  table.insert(buffer, " ")
  table.insert(parts, table.concat(buffer, ""))
 end

 table.insert(parts, "%#BufferlineFill#")
 table.insert(parts, "%=")

 local tabs = vim.fn.gettabinfo()
 for i = 1,#tabs do
  local tab = {}
  table.insert(tab, "%#Tab#[")
  table.insert(tab, tabs[i].tabnr)
  table.insert(tab, "]")
  table.insert(parts, table.concat(tab, ""))
 end

 local line = table.concat(parts, "") .. " "
 return line
end

vim.o.showtabline = 2
vim.o.tabline = "%!v:lua.tabline()"
