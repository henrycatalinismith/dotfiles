--------------------------------
-- au --------------------------
------ autocmds ----------------
--------------------------------
--- Open diagnostic on cursorhold
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

-- Set up css config
local function au_css()
 vim.api.nvim_create_autocmd(
  "FileType",
  {
   pattern = {
    "css",
    "less",
    "sass",
    "scss",
   },
   callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop =
     2
    vim.opt_local.expandtab =
     true
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
    vim.opt_local.softtabstop =
     2
    vim.opt_local.expandtab =
     true
   end,
  }
 )
end

-- Set up php config
local function au_php()
 vim.api.nvim_create_autocmd(
  "FileType",
  {
   pattern = {
    "php",
   },
   callback = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop =
     4
    vim.opt_local.expandtab =
     true
   end,
  }
 )
end

--------------------------------
-- cmd -------------------------
------- commands ---------------
--------------------------------

local function cmd_format_disable()
 vim.api.nvim_create_user_command(
  "FormatDisable",
  function()
   vim.g.enable_autoformat =
    false
  end,
  {
   desc = "Disable autoformat on save",
   nargs = 0,
   bang = false,
  }
 )
end

local function cmd_format_enable()
 vim.api.nvim_create_user_command(
  "FormatEnable",
  function()
   vim.g.enable_autoformat =
    true
  end,
  {
   desc = "Enable autoformat on save",
   nargs = 0,
   bang = false,
  }
 )
end

local function cmd_format_file()
 vim.api.nvim_create_user_command(
  "FormatFile",
  function()
   require("conform").format({
    async = true,
   })
  end,
  {
   desc = "Format the current buffer",
   nargs = 0,
   bang = false,
  }
 )
end

local function cmd_format_skip()
 vim.api.nvim_create_user_command(
  "FormatSkip",
  function()
   local prev =
    vim.g.enable_autoformat
   vim.g.enable_autoformat =
    false
   vim.cmd("w")
   vim.g.enable_autoformat =
    prev
  end,
  {
   desc = "Save without format",
   nargs = 0,
   bang = false,
  }
 )
end

local function cmd_format_trailing()
 vim.api.nvim_create_user_command(
  "FormatTrailing",
  function()
   local pos =
    vim.fn.getpos(".")
   vim.cmd([[%s/\s\+$//e]])
   vim.fn.setpos(".", pos)
  end,
  {
   desc = "Remove trailing whitespace",
   nargs = 0,
   bang = false,
  }
 )
end

local function cmd_lsp_action()
 vim.api.nvim_create_user_command(
  "LspAction",
  function()
   vim.lsp.buf.code_action()
  end,
  {
   desc = "Open LSP code actions menu",
   nargs = 0,
   bang = false,
  }
 )
end

local function cmd_nvim_config()
 vim.api.nvim_create_user_command(
  "NvimConfig",
  function()
   if
    vim.api.nvim_buf_get_name(0)
    == ""
   then
    vim.cmd(
     "e ~/.config/nvim/init.lua"
    )
   else
    vim.cmd(
     "tabnew ~/.config/nvim/init.lua"
    )
   end
  end,
  {
   desc = "Open nvim config",
   nargs = 0,
   bang = false,
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
   bg = "#555555",
  }
 )
 vim.cmd(
  [[match TrailingWhitespace /\s\+$/]]
 )
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
local function kb_telescope_cmdline()
 vim.keymap.set(
  "n",
  "<leader><leader>",
  ":Telescope cmdline<CR>",
  {}
 )
end

-- <leader>la :LspAction
local function kb_lsp_action()
 vim.keymap.set(
  "n",
  "<leader>la",
  ":LspAction<CR>",
  {}
 )
end

-- Map <leader>, to open config
--
-- Intended to resemble <Cmd>,
-- which by convention opens
-- config menus in macOS apps.
local function kb_nvim_config()
 vim.keymap.set(
  "n",
  "<leader>,",
  ":NvimConfig<CR>",
  {}
 )
end

-- Map <leader>p to fuzzy find
--
-- <Cmd>P opens this menu in
-- many editors so this imitates
-- that.
local function kb_find_files()
 vim.keymap.set(
  "n",
  "<leader>p",
  ":Telescope find_files<CR>",
  { noremap = true }
 )
end

-- Map <leader>fd to disable
-- autoformat
local function kb_format_disable()
 vim.keymap.set(
  "n",
  "<leader>fd",
  ":FormatDisable<CR>",
  { noremap = true }
 )
end

-- Map <leader>fe to enable
-- autoformat
local function kb_format_enable()
 vim.keymap.set(
  "n",
  "<leader>fe",
  ":FormatEnable<CR>",
  { noremap = true }
 )
end

-- Map <leader>ff to autoformat
local function kb_format_file()
 vim.keymap.set(
  "n",
  "<leader>ff",
  ":FormatFile<CR>",
  { noremap = true }
 )
end

-- <leader>fs FormatSkip
local function kb_format_skip()
 vim.keymap.set(
  "n",
  "<leader>fs",
  ":FormatSkip<CR>",
  { noremap = true }
 )
end

-- <leader>ft FormatTrailing
local function kb_format_trailing()
 vim.keymap.set(
  "n",
  "<leader>ft",
  ":FormatTrailing<CR>",
  { noremap = true }
 )
end

-- <leader>lg :Lspsaga goto_definition
local function kb_lsp_goto_definition()
 vim.keymap.set(
  "n",
  "<leader>lg",
  ":Lspsaga goto_definition<CR>",
  {}
 )
end

-- <leader>lu :Lspsaga goto_type_definition
local function kb_lsp_goto_type()
 vim.keymap.set(
  "n",
  "<leader>lu",
  ":Lspsaga goto_type_definition<CR>",
  {}
 )
end

-- Map <leader>lh to hover
--
-- Hovering the mouse cursor
-- would be the usual way to
-- invoke this in other
-- editors.
local function kb_lsp_hover()
 vim.keymap.set(
  "n",
  "<leader>lh",
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
local function kb_move_line()
 vim.keymap.set(
  "n",
  "<A-Down>",
  ":m .+1<CR>==",
  {
   noremap = true,
   silent = true,
  }
 )
 vim.keymap.set(
  "n",
  "<A-Up>",
  ":m .-2<CR>==",
  {
   noremap = true,
   silent = true,
  }
 )
 vim.keymap.set(
  "v",
  "<A-Down>",
  ":m '>+1<CR>gv=gv",
  {
   noremap = true,
   silent = true,
  }
 )
 vim.keymap.set(
  "v",
  "<A-Up>",
  ":m '<-2<CR>gv=gv",
  {
   noremap = true,
   silent = true,
  }
 )
 vim.keymap.set(
  "i",
  "<A-Down>",
  "<Esc>:m .+1<CR>==gi",
  {
   noremap = true,
   silent = true,
  }
 )
 vim.keymap.set(
  "i",
  "<A-Up>",
  "<Esc>:m .-2<CR>==gi",
  {
   noremap = true,
   silent = true,
  }
 )
end

-- <leader>ln :Lspsaga diagnostic_jump_next
local function kb_lsp_next_diagnostic()
 vim.keymap.set(
  "n",
  "<leader>ln",
  ":Lspsaga diagnostic_jump_next<CR>",
  {}
 )
end

-- <leader>ld :Lspsaga peek_definition
local function kb_lsp_peek_definition()
 vim.keymap.set(
  "n",
  "<leader>ld",
  ":Lspsaga peek_definition<CR>",
  {}
 )
end

-- <leader>lt :Lspsaga peek_type_definition
local function kb_lsp_peek_type()
 vim.keymap.set(
  "n",
  "<leader>lt",
  ":Lspsaga peek_type_definition<CR>",
  {}
 )
end

-- <leader>lr :Lspsaga rename
local function kb_lsp_rename()
 vim.keymap.set(
  "n",
  "<leader>lr",
  ":Lspsaga rename<CR>",
  { noremap = true }
 )
end

-- Map <leader>lx to restart LSP
local function kb_lsp_restart()
 vim.keymap.set(
  "n",
  "<leader>lx",
  ":LspRestart<CR>",
  {}
 )
end

-- Map <leader>q to quit
--
-- Tend to go back and forth on
-- whether or not to have ! on
-- the end of this.
local function kb_quit()
 vim.keymap.set(
  "n",
  "<leader>q",
  ":q<CR>",
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
local function kb_tabs()
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

-- Map <leader>b to nvim tree
local function kb_tree()
 vim.keymap.set(
  "n",
  "<leader>b",
  ":NvimTreeToggle<CR>",
  { noremap = true }
 )
end

-- Map <leader>w to write
local function kb_write()
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
 vim.opt.clipboard =
  "unnamedplus"
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
 vim.opt.fillchars:append({
  eob = " ",
 })
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

local function init()
 au_cursorhold()
 au_css()
 au_js()
 au_php()

 cmd_format_disable()
 cmd_format_enable()
 cmd_format_file()
 cmd_format_skip()
 cmd_format_trailing()
 cmd_lsp_action()
 cmd_nvim_config()

 kb_set_leader()
 kb_find_files()
 kb_format_disable()
 kb_format_enable()
 kb_format_file()
 kb_format_skip()
 kb_format_trailing()
 kb_lsp_action()
 kb_lsp_goto_definition()
 kb_lsp_goto_type()
 kb_lsp_hover()
 kb_lsp_next_diagnostic()
 kb_lsp_peek_definition()
 kb_lsp_peek_type()
 kb_lsp_rename()
 kb_lsp_restart()
 kb_move_line()
 kb_nvim_config()
 kb_quit()
 kb_write()
 kb_tabs()
 kb_telescope_cmdline()
 kb_tree()

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
end

init()

vim.pack.add({
 "https://github.com/hrsh7th/nvim-cmp",
 "https://github.com/hrsh7th/cmp-cmdline",
 "https://github.com/hrsh7th/cmp-nvim-lsp",
 "https://github.com/lewis6991/gitsigns.nvim",
 "https://github.com/neovim/nvim-lspconfig",
 -- "https://github.com/nanozuki/tabby.nvim",
 "https://github.com/nvim-treesitter/nvim-treesitter",
 "https://github.com/nvim-lua/plenary.nvim",
 "https://github.com/nvim-tree/nvim-web-devicons",
 "https://github.com/mason-org/mason.nvim",
 "https://github.com/mason-org/mason-lspconfig.nvim",
 "https://github.com/nvim-telescope/telescope.nvim",
 "https://github.com/jonarrien/telescope-cmdline.nvim",
 "https://github.com/nvim-telescope/telescope-ui-select.nvim",
 "https://github.com/nvimdev/lspsaga.nvim",
 "https://github.com/nvim-lualine/lualine.nvim",
 "https://github.com/nvimtools/none-ls.nvim",
 "https://github.com/nvimtools/none-ls-extras.nvim",
 "https://github.com/maxmx03/solarized.nvim",
 "https://github.com/nvim-tree/nvim-tree.lua",
 "https://github.com/folke/which-key.nvim",
})

local cmp = require("cmp")
cmp.setup({
 mapping = cmp.mapping.preset.insert({
  ["<C-b>"] = cmp.mapping.scroll_docs(
   -4
  ),
  ["<C-f>"] = cmp.mapping.scroll_docs(
   4
  ),
  ["<C-Space>"] = cmp.mapping.complete(),
  ["<C-e>"] = cmp.mapping.abort(),
  ["<Tab>"] = cmp.mapping.confirm({
   select = true,
  }),
  ["<CR>"] = cmp.mapping.confirm({
   select = true,
  }),
 }),
 sources = {
  { name = "nvim_lsp" },
 },
 window = {
  completion = cmp.config.window.bordered(),
  documentation = cmp.config.window.bordered(),
 },
})

cmp.setup.cmdline(":", {
 mapping = cmp.mapping.preset.cmdline(),
 sources = cmp.config.sources(
  {
   {
    name = "path",
   },
  },
  {
   {
    name = "cmdline",
    option = {
     ignore_cmds = {
      "Man",
      "!",
     },
    },
   },
  }
 ),
})

require("gitsigns").setup({
 current_line_blame = true,
 current_line_blame_opts = {
  delay = 32,
  virt_text_pos = "right_align",
 },
})

-- require("tabby").setup()

require("mason").setup()

require("mason-lspconfig").setup({
 ensure_installed = {
  "cssls",
  "lua_ls",
  "ts_ls",
 }
})

require("lspconfig").cssls.setup({})
require("lspconfig").lua_ls.setup({})
require("lspconfig").ts_ls.setup({})

require("telescope").setup({
 extensions = {
  ["cmdline"] = {
   icons = {
    history = "󱑈 ",
    command = " ",
    number = "󰴍 ",
    system = "",
    unknown = "",
   },
   ["ui-select"] = {
    require(
     "telescope.themes"
    ).get_dropdown({}),
   },
  },
 },
})

require("telescope").load_extension("ui-select")

require("lspsaga").setup({
 lightbulb = {
  virtual_text = false,
 },
})

require("lualine").setup()

require("null-ls").setup({
 debug = true,
 sources = {
  require(
   "none-ls.code_actions.eslint_d"
  ),
  require(
   "none-ls.diagnostics.eslint_d"
  ),
 },
})

require("solarized").setup({
 on_colors = function()
  return {
   base03 = "#032029",
  }
 end,
 on_highlights = function(c)
  return {
   CursorLineNr = {
    bg = c.base02,
   },
   LineNr = {
    bg = c.base03,
   },
   SignColumn = {
    bg = c.base03,
   },
  }
 end,
})

vim.cmd.colorscheme("solarized")

require("nvim-tree").setup({
 update_focused_file = {
  enable = true,
 },
})

local wk = require("which-key")
wk.setup({
 triggers = { "<leader>" },
})
wk.add({
 {
  "<leader>w",
  group = "File",
 },
})

