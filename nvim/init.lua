vim.g.mapleader = " "
vim.o.mouse = "a"
vim.o.showtabline = 2
vim.o.termguicolors = true
vim.wo.number = true

vim.api.nvim_set_keymap(
 "n",
 "<leader>n",
 ":tabnew<CR>",
 { noremap = true }
)

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

vim.cmd([[autocmd BufWritePost plugins.lua luafile %]])
vim.cmd([[autocmd BufWritePost plugins.lua PackerCompile]])

local install_path = vim.fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system({"git", "clone", "https://github.com/wbthomason/packer.nvim", install_path})
  vim.cmd "packadd packer.nvim"
end

require("plugins")
