return require("packer").startup(function()
 use "wbthomason/packer.nvim"
 use { "dracula/vim" }
 use { "editorconfig/editorconfig-vim" }
 use { "mkitt/tabline.vim" }
 use { "neoclide/coc.nvim", branch = "release" }
 use { "sheerun/vim-polyglot" }

 use {
  "nvim-telescope/telescope.nvim",
  requires = {
   {"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}}
 }

 use {
  "lewis6991/gitsigns.nvim",
  requires = {
   "nvim-lua/plenary.nvim"
  }
 }

 use {
  "hoob3rt/lualine.nvim",
  requires = {
   "kyazdani42/nvim-web-devicons",
   opt = true
  },
  config = function() require("lualine").setup() end
 }

end)

