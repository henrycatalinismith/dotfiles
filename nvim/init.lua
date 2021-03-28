local cmd = vim.api.nvim_command

vim.g.mapleader = " "
vim.o.mouse = "a"
vim.o.showtabline = 2
vim.o.termguicolors = true
vim.wo.number = true
vim.wo.signcolumn = "yes"

function leader(key, cmd)
 vim.api.nvim_set_keymap(
  "n",
  "<leader>" .. key,
  cmd,
  { noremap = true }
 )
end

leader("p", ":Telescope find_files<CR>")
leader("q", ":quit!<CR>")
leader("t", ":NvimTreeToggle<CR>")
leader("w", ":write<CR>")
leader("wq", ":write<CR>:quit!<CR>")

cmd("hi LineNr       guifg=#83769C")
cmd("hi Pmenu        guibg=#f8f8f2 guifg=#282a36")
cmd("hi PmenuSbar    guibg=#44475a")
cmd("hi PmenuSel     guibg=#6272a4")
cmd("hi SignColumn   guibg=#21222C")
cmd("hi TabLine      guifg=#ffffff  guibg=NONE")
cmd("hi TabLineFill  guifg=#282b36")
cmd("hi TabLineSel   guifg=#000000  guibg=#bd93f9")
cmd("hi CocErrorFloat guibg=#ff5555")

cmd("hi GitSignsAdd    guibg=#21222C guifg=#50fa7b")
cmd("hi GitSignsChange guibg=#21222C guifg=#8be9fd")
cmd("hi GitSignsDelete guibg=#21222C guifg=#ff5555")

cmd("hi VertSplit guibg=#282a36 guifg=#44475a")

require("plugins")

