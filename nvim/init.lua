vim.g.mapleader = " "

if vim.g.vscode then
 require("vscode")
else
 require("vanilla")
 require("plugins")
end


