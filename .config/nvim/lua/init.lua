return require("packer").startup(function()

	use { "editorconfig/editorconfig-vim" }
	use { "kien/ctrlp.vim" }
	use { "mkitt/tabline.vim" }
	use { "neoclide/coc.nvim", branch = "release" }
	use { "sheerun/vim-polyglot" }

	use {
		'lewis6991/gitsigns.nvim',
		requires = {
			'nvim-lua/plenary.nvim'
		},
		config = function()
			require('gitsigns').setup()
		end
	}

end)
