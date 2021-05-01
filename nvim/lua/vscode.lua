vim.api.nvim_set_keymap(
 "n",
 "<leader>q",
 "<Cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<CR>",
 { noremap = true }
)

vim.api.nvim_set_keymap(
 "n",
 "<leader>w",
 "<Cmd>call VSCodeNotify('workbench.action.files.save')<CR>",
 { noremap = true }
)

