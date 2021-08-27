local packer = require("packer")
local telescope = require("./plugins/telescope")

vim.g.coc_global_extensions = {
 "coc-css",
 "coc-flutter",
 "coc-lua",
 "coc-tsserver",
}

local plugins = packer.startup(
 function(use)

  -- https://github.com/wbthomason/packer.nvim
  use({
   "wbthomason/packer.nvim",
  })

  -- https://github.com/overcache/NeoSolarized
  use({
   "overcache/NeoSolarized",
   config = function()
    vim.api.nvim_command("set background=dark")
    vim.api.nvim_command("colorscheme NeoSolarized")
   end
  })

  -- https://github.com/editorconfig/editorconfig-vim
  use({
   "editorconfig/editorconfig-vim",
  })

  -- https://github.com/neoclide/coc.nvim
  use({
   "neoclide/coc.nvim",
   branch = "release",
   config = function()
   end
  })

  -- https://github.com/nvim-treesitter/nvim-treesitter
  use({
   "nvim-treesitter/nvim-treesitter",
   run = ":TSUpdate",
   config = function()
    require("nvim-treesitter.configs").setup({
     ensure_installed = {
      "c",
      "dart",
      "javascript",
      "lua",
      "ruby",
      "typescript",
     },
     highlight = {
      enable = true,
     },
    })
   end
  })

  -- https://github.com/kyazdani42/nvim-tree.lua
  use({
   "kyazdani42/nvim-tree.lua",
   config = function()
    vim.api.nvim_set_keymap(
     "n",
     "<leader>t",
     ":NvimTreeToggle<CR>",
     { noremap = true }
    )
    vim.g.nvim_tree_follow = 1
    vim.g.nvim_tree_gitignore = 1
    vim.g.nvim_tree_show_icons = {
     git = 0,
     folders = 0,
     files = 0
    }
    vim.g.nvim_tree_icons = {
     default = "",
     git = {
      unstaged = "",
      staged = "",
      unmerged = "",
      renamed = "",
      untracked = "",
      deleted = "",
      ignored = ""
     },
    }
   end
  })

  -- https://github.com/lewis6991/gitsigns.nvim
  use({
   "lewis6991/gitsigns.nvim",
   requires = {
    {"nvim-lua/plenary.nvim"},
   },
   config = function()
    vim.wo.signcolumn = "yes"
    require("gitsigns").setup()
   end
  })

  -- https://github.com/hoob3rt/lualine.nvim
  use({
   "hoob3rt/lualine.nvim",
   requires = {{
    "kyazdani42/nvim-web-devicons",
    opt = true
   }},
   config = function()
    -- https://github.com/hoob3rt/lualine.nvim/issues/276#issuecomment-877825032
    require("plenary.reload").reload_module("lualine", true)
    require("lualine").setup({
     options = {
      theme = "solarized_dark",
     },
    })
   end
  })

  -- https://github.com/wellle/tmux-complete.vim
  use({
   "wellle/tmux-complete.vim",
  })

  -- https://github.com/nvim-telescope/telescope.nvim
  use({
   "nvim-telescope/telescope.nvim",
   requires = {
    {"nvim-lua/popup.nvim"},
    {"nvim-lua/plenary.nvim"},
   },
   config = function()
    require("telescope").setup({
     defaults = {
      dynamic_preview_title = true,
     },
    })

    vim.api.nvim_set_keymap(
     "n",
     "<leader>g",
     ":lua require('./plugins/telescope').live_grep()<CR>",
     { noremap = true }
    )

    vim.api.nvim_set_keymap(
     "n",
     "<leader>h",
     ":lua require('./plugins/telescope').git_bcommits()<CR>",
     { noremap = true }
    )

    vim.api.nvim_set_keymap(
     "n",
     "<leader>p",
     ":lua require('./plugins/telescope').git_files()<CR>",
     { noremap = true }
    )

   end
  })

  -- https://github.com/AckslD/nvim-neoclip.lua
  use({
   "AckslD/nvim-neoclip.lua",
   config = function()
    require("neoclip").setup()

    vim.api.nvim_set_keymap(
     "n",
     "<leader>c",
     ":lua require('telescope').extensions.neoclip.default()<CR>",
     { noremap = true }
    )

   end
  })

 end
)
