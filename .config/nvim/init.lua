local cmd = vim.api.nvim_command

--if empty(glob("~/.local/share/nvim/site/pack/packer/start/packer.nvim"))
  --silent !git clone https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
--endif

vim.o.mouse = "a"
vim.wo.number = true
vim.o.showtabline = 2
vim.wo.signcolumn = "yes"
vim.o.termguicolors = true

local function map(mode, lhs, rhs, opts)
 local options = {noremap = true}
 if opts then options = vim.tbl_extend('force', options, opts) end
 vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.g.mapleader = " "
map("n", "<leader>p", ":Telescope find_files<CR>")
map("n", "<leader>q", ":quit!<CR>")
map("n", "<leader>t", ":NvimTreeToggle<CR>")
map("n", "<leader>w", ":write<CR>")
map("n", "<leader>wq", ":write<CR>:quit!<CR>")


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

