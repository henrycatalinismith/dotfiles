local r =
 "https://github.com/folke/lazy.nvim.git"
local d = vim.fn.stdpath("data")
vim.fn.system({ "mkdir", d })
vim.fn.system({
 "mkdir",
 d .. "/lazy",
})
vim.fn.system({
 "git",
 "clone",
 "--filter=blob:none",
 "--branch=stable",
 r,
 d .. "/lazy/lazy.nvim",
})
vim.opt.rtp:prepend(
 d .. "/lazy/lazy.nvim"
)

require("lazy").setup({
 spec = {
  {
   "https://github.com/stevearc/conform.nvim",
   config = function()
    require("conform").setup({
     format_on_save = { timeout_ms = 1024 },
     formatters_by_ft = {
      javascript = { "prettier" },
     },
    })
   end,
  },
 },
})

