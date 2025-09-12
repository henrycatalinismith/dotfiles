vim.pack.add({
 "https://github.com/neovim/nvim-lspconfig",
})

require("lspconfig").ts_ls.setup({})
vim.diagnostic.config({ virtual_text = true })

