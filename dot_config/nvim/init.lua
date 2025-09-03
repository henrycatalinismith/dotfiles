--------------------------------
-- au --------------------------
------ autocmds ----------------
--------------------------------

-- Open diagnostic on cursorhold
local function au_cursorhold()
 vim.api.nvim_create_autocmd(
  "CursorHold",
  {
   callback = function()
    vim.diagnostic.open_float(
     nil,
     {
      focus = false,
      scope = "line",
      border = "rounded",
      max_width = 80,
      header = " Diagnostics",
      source = "always",
     }
    )
   end,
  }
 )
end

-- Set up [jt]sx? config
local function au_js()
 vim.api.nvim_create_autocmd(
  "FileType",
  {
   pattern = {
    "typescript",
    "typescriptreact",
    "javascript",
    "javascriptreact",
   },
   callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.expandtab = true
   end,
  }
 )
end

--------------------------------
-- hl --------------------------
------ highlighting ------------
--------------------------------

local function hl_trailing_whitespace()
 vim.api.nvim_set_hl(
  0,
  "TrailingWhitespace",
  {
   ctermbg = "gray",
   bg = "#555555"
  }
 )
 vim.cmd([[match TrailingWhitespace /\s\+$/]])
end

--------------------------------
-- kb --------------------------
------ keyboard ----------------
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

-- Space twice to open cmdline
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

-- Map <leader>, to open config
--
-- Intended to resemble <Cmd>,
-- which by convention opens
-- config menus in macOS apps.
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

-- Map <leader>p to fuzzy find
--
-- <Cmd>P opens this menu in
-- many editors so this imitates
-- that.
local function kb_map_find_files()
 vim.keymap.set(
  "n",
  "<leader>p",
  ":Telescope find_files<CR>",
  { noremap = true }
 )
end

-- Map <leader>f to autoformat
local function kb_map_format()
 vim.keymap.set(
  "n",
  "<leader>f",
  ":lua require('conform').format({ async = true })<CR>",
  { noremap = true }
 )
end

-- Map <leader>d to definition
--
-- This is usually invoked by
-- clicking while holding <Cmd>
-- but we're not in mouseland.
local function kb_map_goto_definition()
 vim.keymap.set(
  "n",
  "<leader>d",
  ":Lspsaga goto_definition<CR>",
  { noremap = true }
 )
end

-- Map <leader>h to hover
--
-- Hovering the mouse cursor
-- would be the usual way to
-- invoke this in other
-- editors.
local function kb_map_hover()
 vim.keymap.set(
  "n",
  "<leader>h",
  ":Lspsaga hover_doc<CR>",
  { noremap = true }
 )
end

-- Map <alt>+↕ to move lines
--
-- Very common for this
-- keybinding to move lines up
-- and down in many editors.
--
-- Clashes unfortunately with
-- Zellij's use of the alt key.
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

-- Map <leader>r to rename
--
-- Typically mapped to F12, this
-- one, which I've always found
-- an odd choice given how often
-- it needs using.
local function kb_map_rename()
 vim.keymap.set(
  "n",
  "<leader>r",
  ":Lspsaga rename<CR>",
  { noremap = true }
 )
end

-- Map <Tab> to tabnext
--
-- gt and gT are fine but in
-- normal mode it feels like a
-- missed opportunity not
-- mapping these keys to
-- something useful.
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

-- Map <leader>t to nvim tree
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
-- opt -------------------------
------- options ----------------
--------------------------------

-- > unnamedplus
-- >
-- > A variant of the "unnamed"
-- > flag which uses the
-- > clipboard register "+"
-- > instead of register "*"
-- > for all yank, delete,
-- > change and put operations
-- > which would normally go to
-- > the unnamed register.
-- >
-- > https://neovim.io/doc/user/options.html#'clipboard'
local function opt_clipboard()
 vim.opt.clipboard = "unnamedplus"
end

-- > exrc
-- >
-- > Enables project-local
-- > configuration. Nvim will
-- > execute any .nvim.lua,
-- > .nvimrc, or .exrc file
-- > found in the current-
-- > directory and all parent
-- > directories (ordered
-- > upwards), if the files are
-- > in the trust list.
-- >
-- > https://neovim.io/doc/user/options.html#'exrc'
local function opt_exrc()
 vim.opt.exrc = true
end

-- > If this many milliseconds
-- > nothing is typed the swap
-- > file will be written to
-- > disk (see crash-recovery).
-- > Also used for the
-- > CursorHold autocommand
-- > event.
-- > https://neovim.io/doc/user/options.html#'updatetime'
local function opt_updatetime()
 vim.opt.updatetime = 512
end

--------------------------------
-- ui --------------------------
------ user interface ----------
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
------ plugins -----------------
--------------------------------

-- > A completion plugin for
-- > neovim coded in Lua.
local function pl_cmp()
 return {
  "https://github.com/hrsh7th/nvim-cmp",
 }
end

-- > nvim-cmp source for neovim
-- > builtin LSP client
local function pl_cmp_lsp()
 return {
  "https://github.com/hrsh7th/cmp-nvim-lsp",
  config = function()
   local cmp = require"cmp"
   require("cmp").setup({
    mapping = cmp.mapping.preset.insert({
     ["<C-b>"] = cmp.mapping.scroll_docs(-4),
     ["<C-f>"] = cmp.mapping.scroll_docs(4),
     ["<C-Space>"] = cmp.mapping.complete(),
     ["<C-e>"] = cmp.mapping.abort(),
     ["<Tab>"] = cmp.mapping.confirm({ select = true }),
    }),
    sources = {
     { name = "nvim_lsp" },
    }
   })
  end,
 }
end

-- > Lightweight yet powerful
-- > formatter plugin for Neovim
local function pl_conform()
 return {
  "https://github.com/stevearc/conform.nvim",
  config = function()
   require("conform").setup({
    format_on_save = { timeout_ms = 500 },
    formatters_by_ft = {
     javascript = { "prettier" },
     javascriptreact = { "prettier" },
     typescript = { "prettier" },
     typescriptreact = { "prettier" },
    },
   })
   kb_map_format()
  end
 }
end

-- > Git integration for buffers
local function pl_gitsigns()
 return {
  "https://github.com/lewis6991/gitsigns.nvim",
  config = function()
   require("gitsigns").setup({
    current_line_blame = true,
    current_line_blame_opts = {
     delay = 32,
     virt_text_pos = "right_align",
    }
   })
  end,
 }
end

-- > Quickstart configs for Nvim LSP
local function pl_lspconfig()
 return {
  "https://github.com/neovim/nvim-lspconfig",
  config = function()
   kb_map_code_action()
  end,
  dependencies = {
   "williamboman/mason.nvim",
   "williamboman/mason-lspconfig.nvim",
  }
 }
end

-- > improve neovim lsp experience
local function pl_lspsaga()
 return {
  "https://github.com/nvimdev/lspsaga.nvim",
  config = function()
   require("lspsaga").setup({
    lightbulb = {
     virtual_text = false,
    },
   })
   kb_map_goto_definition()
   kb_map_hover()
   kb_map_rename()
  end,
  dependencies = {
   "nvim-treesitter/nvim-treesitter",
   "nvim-tree/nvim-web-devicons",
  }
 }
end

-- > A blazing fast and easy to
-- > configure neovim
-- > statusline plugin written
-- > in pure lua.
local function pl_lualine()
 return {
  "https://github.com/nvim-lualine/lualine.nvim",
  dependencies = {
   "nvim-tree/nvim-web-devicons"
  },
  config = function()
   require("lualine").setup()
  end
 }
end

-- > Portable package manager
-- > for Neovim that runs
-- > everywhere Neovim runs
local function pl_mason()
 return {
  "https://github.com/mason-org/mason.nvim",
  config = function()
   require("mason").setup()
  end,
 }
end

-- > Extension to mason.nvim
-- > that makes it easier to
-- > use lspconfig with
-- > mason.nvim.
local function pl_mason_lspconfig()
 return {
  "https://github.com/mason-org/mason-lspconfig.nvim",
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

local function pl_none_ls()
 return {
  "https://github.com/nvimtools/none-ls.nvim",
  config = function()
   require("null-ls").setup({
    sources = {
     require("none-ls.diagnostics.eslint")
    },
   })
  end,
  dependencies = {
   "nvimtools/none-ls-extras.nvim",
  }
 }
end

-- > Solarized port for Neovim
local function pl_solarized()
 return {
  "https://github.com/maxmx03/solarized.nvim",
  lazy = false,
  priority = 1000,
  opts = {
   on_colors = function()
    return {
     base03 = "#032029",
    }
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
   vim.o.background = "dark"
   require("solarized").setup(opts)
   vim.cmd.colorscheme "solarized"
  end,
 }
end

-- > A declarative, highly
-- > configurable, and neovim
-- > style tabline plugin.
local function pl_tabby()
 return {
  "https://github.comnanozuki/tabby.nvim",
  config = function()
   require("tabby").setup({})
  end
 }
end

-- > An unofficial Tailwind CSS
-- > integration and tooling
-- > for Neovim
local function pl_tailwind_tools()
 return {
  "https://github.com/luckasRanarison/tailwind-tools.nvim",
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

-- > Find, Filter, Preview,
-- > Pick. All lua, all the
-- > time.
local function pl_telescope()
 return {
  "https://github.com/nvim-telescope/telescope.nvim",
  dependencies = {
   "nvim-lua/plenary.nvim",
  },
  config = function()
   kb_map_find_files()
  end
 }
end

-- > Telescope cmdline
local function pl_telescope_cmdline()
 return {
  "https://github.com/jonarrien/telescope-cmdline.nvim",
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

-- > sets vim.ui.select to
-- > telescope. That means for
-- > example that neovim core
-- > stuff can fill the telescope
-- > picker
local function pl_telescope_ui_select()
 return {
  "https://github.com/nvim-telescope/telescope-ui-select.nvim",
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

-- > A file explorer tree for
-- > neovim written in lua
-- > https://github.com/nvim-tree/nvim-tree.lua
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
------ lazy.nvim ---------------
--------------------------------

-- Load lazy.nvim
--
-- Based on the single file
-- setup instructions from
-- https://github.com/folke/lazy.nvim
local function lz_load()
 local r = "https://github.com/folke/lazy.nvim.git"
 local d = vim.fn.stdpath("data")
 vim.fn.system({ "mkdir", d })
 vim.fn.system({ "mkdir", d .. "/lazy" })
 vim.fn.system({
  "git",
  "clone",
  "--filter=blob:none",
  "--branch=stable",
  r,
  d .. "/lazy/lazy.nvim"
 })
 vim.opt.rtp:prepend(
  d .. "/lazy/lazy.nvim"
 )
end

-- Configure lazy.nvim
--
-- This is where plugins get
-- installed. Each line here
-- corresponds to a plugin.
local function lz_spec()
 return {
  pl_cmp(),
  pl_cmp_lsp(),
  pl_conform(),
  pl_gitsigns(),
  pl_lspconfig(),
  pl_lspsaga(),
  pl_lualine(),
  pl_mason(),
  pl_mason_lspconfig(),
  pl_none_ls(),
  pl_solarized(),
  pl_tabby(),
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
 au_cursorhold()
 au_js()

 kb_set_leader()
 kb_map_config()
 kb_map_move_line()
 kb_map_quit()
 kb_map_write()
 kb_map_tabs()

 hl_trailing_whitespace()

 opt_clipboard()
 opt_exrc()
 opt_updatetime()

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

