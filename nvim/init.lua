vim.g.mapleader = " "
vim.o.mouse = "a"
vim.o.showtabline = 2
vim.o.termguicolors = true
vim.wo.number = true
vim.wo.signcolumn = "yes"

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

require("plugins")

