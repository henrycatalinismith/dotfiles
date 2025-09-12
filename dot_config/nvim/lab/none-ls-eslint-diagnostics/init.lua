vim.pack.add({
 "https://github.com/nvimtools/none-ls.nvim",
 "https://github.com/nvimtools/none-ls-extras.nvim",
 "https://github.com/nvim-lua/plenary.nvim",
})

require("null-ls").setup({
 sources = {
  require(
   "none-ls.diagnostics.eslint"
  ),
 },
})
