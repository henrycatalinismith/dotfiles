-------------------------------
-- kb --------------------------
--------------------------------

-- Use space as the leader key
--
-- Space is the biggest key on
-- a standard keyboard and
-- doesn't do anything by
-- default in normal mode.
local function kb_set_leader()
 vim.g.mapleader = " "
end

local function kb_map_cmdline()
 vim.keymap.set(
  "n",
  "<leader><leader>",
  ":Telescope cmdline<CR>",
  {}
 )
end

-- Map <leader>. to code_action
--
-- Intended to be a bit similar
-- to <Cmd>. in VSCode.
local function kb_map_code_action()
 vim.keymap.set(
  "n",
  "<leader>.",
  vim.lsp.buf.code_action,
  {}
 )
end

local function kb_map_config()
 vim.keymap.set(
  "n",
  "<leader>,",
  function()
   if vim.api.nvim_buf_get_name(0) == "" then
    vim.cmd("e ~/.config/nvim/init.lua")
   else
    vim.cmd("tabnew ~/.config/nvim/init.lua")
   end
  end,
  {}
 )
end

local function kb_map_find_files()
 vim.keymap.set(
  "n",
  "<leader>p",
  ":Telescope find_files<CR>",
  { noremap = true }
 )
end

local function kb_map_move_line()
 vim.keymap.set(
  "n",
  "<A-Down>",
  ":m .+1<CR>==",
  { noremap = true, silent = true }
 )
 vim.keymap.set(
  "n",
  "<A-Up>",
  ":m .-2<CR>==",
  { noremap = true, silent = true }
 )
 vim.keymap.set(
  "v",
  "<A-Down>",
  ":m '>+1<CR>gv=gv",
  { noremap = true, silent = true }
 )
 vim.keymap.set(
  "v",
  "<A-Up>",
  ":m '<-2<CR>gv=gv",
  { noremap = true, silent = true }
 )
 vim.keymap.set(
  "i",
  "<A-Down>",
  "<Esc>:m .+1<CR>==gi",
  { noremap = true, silent = true }
 )
 vim.keymap.set(
  "i",
  "<A-Up>",
  "<Esc>:m .-2<CR>==gi",
  { noremap = true, silent = true }
 )
end

-- Map <leader>q to quit
--
-- Tend to go back and forth on
-- whether or not to have ! on
-- the end of this.
local function kb_map_quit()
 vim.keymap.set(
  "n",
  "<leader>q",
  ":q<CR>",
  { noremap = true }
 )
end

local function kb_map_rename()
 vim.keymap.set(
  "n",
  "<leader>r",
  ":Lspsaga rename<CR>",
  { noremap = true }
 )
end

local function kb_map_tabs()
 vim.keymap.set(
  "n",
  "<Tab>",
  ":tabnext<CR>",
  { noremap = true }
 )
 vim.keymap.set(
  "n",
  "<S-Tab>",
  ":tabprev<CR>",
  { noremap = true }
 )
end

local function kb_map_tree()
 vim.keymap.set(
  "n",
  "<leader>b",
  ":NvimTreeToggle<CR>",
  { noremap = true }
 )
end

-- Map <leader>w to write
local function kb_map_write()
 vim.keymap.set(
  "n",
  "<leader>w",
  ":w<CR>",
  { noremap = true }
 )
end

--------------------------------
-- ui --------------------------
--------------------------------

-- Terminal colors on
--
-- Without this none of the
-- colors work properly in the
-- terminal.
local function ui_enable_guicolors()
 vim.o.termguicolors = true
end

-- Hide the startup tildes
local function ui_hide_tildes()
 vim.opt.fillchars:append {
  eob = " ",
 }
end

-- Highlight the cursor line
--
-- Even if the whole line
-- isn't being highlighted it's
-- useful to at least highlight
-- the current line number.
local function ui_show_cursorline()
 vim.o.cursorline = true
end

-- Line numbers up to 9999
--
-- Setting a wide column for the
-- line numbers minimizes UI
-- movement when file lengths
-- change.
local function ui_show_numbers()
 vim.o.number = true
 vim.o.numberwidth = 4
end

-- Max out the signcolumn
--
-- Using both available columns
-- for this allows for a little
-- bit of whitespace between an
-- icon and the left of the
-- window.
local function ui_show_signcolumn()
 vim.o.signcolumn = "yes:2"
end

-- Always show the tabline
--
-- There's always exactly one
-- tab open on startup and then
-- 99% of use cases involve
-- opening more. Hiding the
-- tabline therefore causes a
-- layout shift almost every
-- time so just always show it
-- so the layout is stable.
local function ui_show_tabline()
 vim.o.showtabline = 2
end

--------------------------------
-- pl --------------------------
--------------------------------

local function pl_cmp()
 return {
  "hrsh7th/nvim-cmp",
 }
end

local function pl_cmp_lsp()
 return {
  "hrsh7th/cmp-nvim-lsp",
  config = function()
   require("cmp").setup({
    sources = {
     { name = "nvim_lsp" },
    }
   })
  end,
 }
end

local function pl_copilot()
 return {
  "github/copilot.vim",
 }
end

local function pl_lspconfig()
 return {
  "neovim/nvim-lspconfig",
  config = function()
   kb_map_code_action()
  end,
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
  }
 }
end

local function pl_lspsaga()
 return {
  "nvimdev/lspsaga.nvim",
  config = function()
   require('lspsaga').setup({})
   kb_map_rename()
  end,
  dependencies = {
   "nvim-treesitter/nvim-treesitter",
   "nvim-tree/nvim-web-devicons",
  }
 }
end

local function pl_lualine()
 return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
   "nvim-tree/nvim-web-devicons"
  },
  config = function()
   require('lualine').setup()
  end
 }
end

local function pl_mason()
 return {
  "williamboman/mason.nvim",
  config = function()
   require("mason").setup()
  end,
 }
end

local function pl_mason_lspconfig()
 return {
  "williamboman/mason-lspconfig.nvim",
  config = function()
   require("mason-lspconfig").setup()
   require("lspconfig").lua_ls.setup {}
   require("lspconfig").ts_ls.setup {}
  end,
  dependencies = {
   "williamboman/mason.nvim",
   "neovim/nvim-lspconfig",
  }
 }
end

local function pl_solarized()
 return {
  'maxmx03/solarized.nvim',
  lazy = false,
  priority = 1000,
  opts = {
   on_colors = function()
    return {
     base03 = "#032029",
    }
    --return {
     -- base00 = "#fdf4dd",
     -- base02 = "#1b2e36",
     -- base03 = "#081418",
    --}
   end,
   on_highlights = function(colors)
    return {
     CursorLineNr = { bg = colors.base02 },
     LineNr = { bg = colors.base03 },
     SignColumn = { bg = colors.base03 },
    }
   end
  },
  config = function(_, opts)
   vim.o.termguicolors = true
   vim.o.background = "dark"
   require("solarized").setup(opts)
   vim.cmd.colorscheme "solarized"
  end,
 }
end

local function pl_tailwind_tools()
 return {
  "luckasRanarison/tailwind-tools.nvim",
  name = "tailwind-tools",
  build = ":UpdateRemotePlugins",
  dependencies = {
   "nvim-treesitter/nvim-treesitter",
   "nvim-telescope/telescope.nvim",
   "neovim/nvim-lspconfig",
  },
  opts = {
   cmp = {
    highlight = "foreground",
   },
   document_color = {
    enabled = true
   }
  }
 }
end

local function pl_telescope()
 return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
   "nvim-lua/plenary.nvim",
  },
  config = function()
   kb_map_find_files()
  end
 }
end

local function pl_telescope_cmdline()
 return {
  "jonarrien/telescope-cmdline.nvim",
  dependencies = {
   "nvim-telescope/telescope.nvim",
   "nvim-tree/nvim-web-devicons",
  },
  config = function()
   require("telescope").setup({
    extensions = {
     ["cmdline"] = {
      icons = {
       history = "󱑈 ",
       command = " ",
       number  = "󰴍 ",
       system  = "",
       unknown = "",
      }
     }
    }
   })
   kb_map_cmdline()
  end
 }
end

local function pl_telescope_ui_select()
 return {
  "nvim-telescope/telescope-ui-select.nvim",
  config = function()
   require("telescope").setup({
    extensions = {
     ["ui-select"] = {
      require("telescope.themes").get_dropdown {}
     }
    }
   })
   require("telescope").load_extension("ui-select")
  end
 }
end

local function pl_tree()
 return {
  "nvim-tree/nvim-tree.lua",
  config = function()
   require("nvim-tree").setup()
   kb_map_tree()
  end
 }
end

--------------------------------
-- lz --------------------------
--------------------------------

-- Load lazy.nvim
--
-- Based on the single file
-- setup instructions from
-- https://github.com/folke/lazy.nvim
local function lz_load()
 local r = "https://github.com/folke/lazy.nvim.git"
 local d = vim.fn.stdpath("data")
 local l = "/lazy/lazy.nvim"
 local lazypath = d .. l
 local exists = vim.fn.isdirectory(r)
 if not exists then
  local out = vim.fn.system({
   "git",
   "clone",
   "--filter=blob:none",
   "--branch=stable",
   r,
   lazypath
  })
  if vim.v.shell_error ~= 0 then
   vim.api.nvim_echo({
    {
     "Failed to clone lazy.nvim:\n",
     "ErrorMsg",
    },
    {
     out,
     "WarningMsg",
    },
    {
     "\nPress any key to exit...",
    },
   }, true, {})
   vim.fn.getchar()
   os.exit(1)
  end
 end
 vim.opt.rtp:prepend(lazypath)
end

local function lz_spec()
 return {
  pl_cmp(),
  pl_cmp_lsp(),
  pl_copilot(),
  pl_lspconfig(),
  pl_lspsaga(),
  pl_lualine(),
  pl_mason(),
  pl_mason_lspconfig(),
  pl_solarized(),
  pl_tailwind_tools(),
  pl_telescope(),
  pl_telescope_cmdline(),
  pl_telescope_ui_select(),
  pl_tree(),
 }
end

-- Setup lazy.nvim
local function lz_setup()
 require("lazy").setup({
  spec = lz_spec()
 })
end

local function init()
 kb_set_leader()
 kb_map_config()
 kb_map_move_line()
 kb_map_quit()
 kb_map_write()
 kb_map_tabs()

 ui_enable_guicolors()
 ui_hide_tildes()
 ui_show_cursorline()
 ui_show_numbers()
 ui_show_signcolumn()
 ui_show_tabline()

 lz_load()
 lz_setup()
end

init()

