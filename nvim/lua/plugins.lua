local packer = require("packer")
local telescope = require("./telescope")

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
    vim.api.nvim_set_keymap(
     "n",
     "<leader>g",
     ":lua require('./telescope').live_grep()<CR>",
     { noremap = true }
    )

    vim.api.nvim_set_keymap(
     "n",
     "<leader>h",
     ":lua require('./telescope').git_bcommits()<CR>",
     { noremap = true }
    )

    vim.api.nvim_set_keymap(
     "n",
     "<leader>p",
     ":lua require('./telescope').git_files()<CR>",
     { noremap = true }
    )

   end
  })

 end
)
