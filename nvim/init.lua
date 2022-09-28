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
 indianred = "#CD5C5C",
 lightcoral = "#F08080",
 salmon = "#FA8072",
 darksalmon = "#E9967A",
 lightsalmon = "#FFA07A",
 crimson = "#DC143C",
 red = "#FF0000",
 firebrick = "#B22222",
 darkred = "#8B0000",
 pink = "#FFC0CB",
 lightpink = "#FFB6C1",
 hotpink = "#FF69B4",
 deeppink = "#FF1493",
 mediumvioletred = "#C71585",
 palevioletred = "#DB7093",
 lightsalmon = "#FFA07A",
 coral = "#FF7F50",
 tomato = "#FF6347",
 orangered = "#FF4500",
 darkorange = "#FF8C00",
 orange = "#FFA500",
 gold = "#FFD700",
 yellow = "#FFFF00",
 lightyellow = "#FFFFE0",
 lemonchiffon = "#FFFACD",
 lightgoldenrodyellow = "#FAFAD2",
 papayawhip = "#FFEFD5",
 moccasin = "#FFE4B5",
 peachpuff = "#FFDAB9",
 palegoldenrod = "#EEE8AA",
 khaki = "#F0E68C",
 darkkhaki = "#BDB76B",
 lavender = "#E6E6FA",
 thistle = "#D8BFD8",
 plum = "#DDA0DD",
 violet = "#EE82EE",
 orchid = "#DA70D6",
 fuchsia = "#FF00FF",
 magenta = "#FF00FF",
 mediumorchid = "#BA55D3",
 mediumpurple = "#9370DB",
 amethyst = "#9966CC",
 blueviolet = "#8A2BE2",
 darkviolet = "#9400D3",
 darkorchid = "#9932CC",
 darkmagenta = "#8B008B",
 purple = "#800080",
 indigo = "#4B0082",
 slateblue = "#6A5ACD",
 darkslateblue = "#483D8B",
 mediumslateblue = "#7B68EE",
 greenyellow = "#ADFF2F",
 chartreuse = "#7FFF00",
 lawngreen = "#7CFC00",
 lime = "#00FF00",
 limegreen = "#32CD32",
 palegreen = "#98FB98",
 lightgreen = "#90EE90",
 mediumspringgreen = "#00FA9A",
 springgreen = "#00FF7F",
 mediumseagreen = "#3CB371",
 seagreen = "#2E8B57",
 forestgreen = "#228B22",
 green = "#008000",
 darkgreen = "#006400",
 yellowgreen = "#9ACD32",
 olivedrab = "#6B8E23",
 olive = "#808000",
 darkolivegreen = "#556B2F",
 mediumaquamarine = "#66CDAA",
 darkseagreen = "#8FBC8F",
 lightseagreen = "#20B2AA",
 darkcyan = "#008B8B",
 teal = "#008080",
 aqua = "#00FFFF",
 cyan = "#00FFFF",
 lightcyan = "#E0FFFF",
 paleturquoise = "#AFEEEE",
 aquamarine = "#7FFFD4",
 turquoise = "#40E0D0",
 mediumturquoise = "#48D1CC",
 darkturquoise = "#00CED1",
 cadetblue = "#5F9EA0",
 steelblue = "#4682B4",
 lightsteelblue = "#B0C4DE",
 powderblue = "#B0E0E6",
 lightblue = "#ADD8E6",
 skyblue = "#87CEEB",
 lightskyblue = "#87CEFA",
 deepskyblue = "#00BFFF",
 dodgerblue = "#1E90FF",
 cornflowerblue = "#6495ED",
 mediumslateblue = "#7B68EE",
 royalblue = "#4169E1",
 blue = "#0000FF",
 mediumblue = "#0000CD",
 darkblue = "#00008B",
 navy = "#000080",
 midnightblue = "#191970",
 cornsilk = "#FFF8DC",
 blanchedalmond = "#FFEBCD",
 bisque = "#FFE4C4",
 navajowhite = "#FFDEAD",
 wheat = "#F5DEB3",
 burlywood = "#DEB887",
 tan = "#D2B48C",
 rosybrown = "#BC8F8F",
 sandybrown = "#F4A460",
 goldenrod = "#DAA520",
 darkgoldenrod = "#B8860B",
 peru = "#CD853F",
 chocolate = "#D2691E",
 saddlebrown = "#8B4513",
 sienna = "#A0522D",
 brown = "#A52A2A",
 maroon = "#800000",
 white = "#FFFFFF",
 snow = "#FFFAFA",
 honeydew = "#F0FFF0",
 mintcream = "#F5FFFA",
 azure = "#F0FFFF",
 aliceblue = "#F0F8FF",
 ghostwhite = "#F8F8FF",
 whitesmoke = "#F5F5F5",
 seashell = "#FFF5EE",
 beige = "#F5F5DC",
 oldlace = "#FDF5E6",
 floralwhite = "#FFFAF0",
 ivory = "#FFFFF0",
 antiquewhite = "#FAEBD7",
 linen = "#FAF0E6",
 lavenderblush = "#FFF0F5",
 mistyrose = "#FFE4E1",
 gainsboro = "#DCDCDC",
 lightgrey = "#D3D3D3",
 silver = "#C0C0C0",
 darkgray = "#A9A9A9",
 gray = "#808080",
 dimgray = "#696969",
 lightslategray = "#778899",
 slategray = "#708090",
 darkslategray = "#2F4F4F",
 black = "#000000",
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

