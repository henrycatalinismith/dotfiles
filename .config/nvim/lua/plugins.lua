return require("packer").startup(function()
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
  },
  config = function()
   require("gitsigns").setup()
  end
 }

end)

