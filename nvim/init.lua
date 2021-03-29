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

require("plugins")

