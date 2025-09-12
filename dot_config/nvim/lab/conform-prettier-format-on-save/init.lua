vim.pack.add({
 "https://github.com/stevearc/conform.nvim",
})

require("conform").setup({
 format_on_save = { timeout_ms = 1024 },
 formatters_by_ft = {
  javascript = { "prettier" },
 },
})

