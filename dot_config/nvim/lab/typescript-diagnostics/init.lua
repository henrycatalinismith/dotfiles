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
   "https://github.com/neovim/nvim-lspconfig",
   config = function()
    require("lspconfig").ts_ls.setup({})
    vim.diagnostic.config({ virtual_text = true })
   end,
  },
 },
})
