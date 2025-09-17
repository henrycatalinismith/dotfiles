--------------------------------
-- commands --------------------
--------------------------------

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
   vim.opt_local.softtabstop = 2
   vim.opt_local.expandtab = true
  end,
 }
)

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

vim.api.nvim_create_autocmd(
 "FileType",
 {
  pattern = {
   "php",
  },
  callback = function()
   vim.opt_local.shiftwidth = 4
   vim.opt_local.tabstop = 4
   vim.opt_local.softtabstop = 4
   vim.opt_local.expandtab = true
  end,
 }
)

vim.api.nvim_create_user_command(
 "CopyRelativePath",
 function()
  vim.fn.setreg("+", vim.fn.expand("%"))
 end,
 {
  desc = "Copy relative path of current file to clipboard",
  nargs = 0,
  bang = false,
 }
)

vim.api.nvim_create_user_command(
 "FormatTrailing",
 function()
  local pos = vim.fn.getpos(".")
  vim.cmd([[%s/\s\+$//e]])
  vim.fn.setpos(".", pos)
 end,
 {
  desc = "Remove trailing whitespace",
  nargs = 0,
  bang = false,
 }
)

vim.api.nvim_create_user_command(
 "NvimConfig",
 function()
  if vim.api.nvim_buf_get_name(0) == "" then
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

--------------------------------
-- highlighting ----------------
--------------------------------

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

--------------------------------
-- keyboard --------------------
--------------------------------

-- Use space as the leader key
--
-- Space is the biggest key on
-- a standard keyboard and
-- doesn't do anything by
-- default in normal mode.
vim.g.mapleader = " "

-- Space twice to open cmdline
vim.keymap.set(
 "n",
 "<leader><leader>",
 ":Telescope cmdline<CR>",
 {}
)

-- Map <leader>, to open config
--
-- Intended to resemble <Cmd>,
-- which by convention opens
-- config menus in macOS apps.
vim.keymap.set(
 "n",
 "<leader>,",
 ":NvimConfig<CR>",
 {}
)

-- Map <leader>p to fuzzy find
--
-- <Cmd>P opens this menu in
-- many editors so this imitates
-- that.
vim.keymap.set(
 "n",
 "<leader>p",
 ":Telescope find_files<CR>",
 { noremap = true }
)

-- <leader>ft FormatTrailing
vim.keymap.set(
 "n",
 "<leader>ft",
 ":FormatTrailing<CR>",
 { noremap = true }
)

-- <leader>lg :Lspsaga goto_definition
vim.keymap.set(
 "n",
 "<leader>lg",
 ":Lspsaga goto_definition<CR>",
 {}
)

vim.keymap.set(
 "n",
 "<leader>lu",
 ":Lspsaga goto_type_definition<CR>",
 {}
)

-- Map <leader>lh to hover
--
-- Hovering the mouse cursor
-- would be the usual way to
-- invoke this in other
-- editors.
vim.keymap.set(
 "n",
 "<leader>lh",
 ":Lspsaga hover_doc<CR>",
 { noremap = true }
)

-- Map <alt>+↕ to move lines
--
-- Very common for this
-- keybinding to move lines up
-- and down in many editors.
--
-- Clashes unfortunately with
-- Zellij's use of the alt key.
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

-- <leader>ln :Lspsaga diagnostic_jump_next
vim.keymap.set(
 "n",
 "<leader>ln",
 ":Lspsaga diagnostic_jump_next<CR>",
 {}
)

-- <leader>ld :Lspsaga peek_definition
vim.keymap.set(
 "n",
 "<leader>ld",
 ":Lspsaga peek_definition<CR>",
 {}
)

-- <leader>lt :Lspsaga peek_type_definition
vim.keymap.set(
 "n",
 "<leader>lt",
 ":Lspsaga peek_type_definition<CR>",
 {}
)

-- Map <leader>lx to restart LSP
vim.keymap.set(
 "n",
 "<leader>lx",
 ":LspRestart<CR>",
 {}
)

-- Map <leader>q to quit
--
-- Tend to go back and forth on
-- whether or not to have ! on
-- the end of this.
vim.keymap.set(
 "n",
 "<leader>q",
 ":q<CR>",
 { noremap = true }
)

-- Map <Tab> to tabnext
--
-- gt and gT are fine but in
-- normal mode it feels like a
-- missed opportunity not
-- mapping these keys to
-- something useful.
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

-- Map <leader>b to nvim tree
vim.keymap.set(
 "n",
 "<leader>b",
 ":NvimTreeToggle<CR>",
 { noremap = true }
)

-- Map <leader>w to write
vim.keymap.set(
 "n",
 "<leader>w",
 ":w<CR>",
 { noremap = true }
)

--------------------------------
-- options ---------------------
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
vim.opt.clipboard = "unnamedplus"

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
vim.opt.exrc = true

-- > If this many milliseconds
-- > nothing is typed the swap
-- > file will be written to
-- > disk (see crash-recovery).
-- > Also used for the
-- > CursorHold autocommand
-- > event.
-- > https://neovim.io/doc/user/options.html#'updatetime'
vim.opt.updatetime = 512

--------------------------------
-- ui --------------------------
------ user interface ----------
--------------------------------

-- Terminal colors on
--
-- Without this none of the
-- colors work properly in the
-- terminal.
vim.o.termguicolors = true

-- Hide the startup tildes
vim.opt.fillchars:append({ eob = " " })

-- Highlight the cursor line
--
-- Even if the whole line
-- isn't being highlighted it's
-- useful to at least highlight
-- the current line number.
vim.o.cursorline = true

-- Line numbers up to 9999
--
-- Setting a wide column for the
-- line numbers minimizes UI
-- movement when file lengths
-- change.
vim.o.number = true
vim.o.numberwidth = 4

-- Max out the signcolumn
--
-- Using both available columns
-- for this allows for a little
-- bit of whitespace between an
-- icon and the left of the
-- window.
vim.o.signcolumn = "yes:2"

-- Always show the tabline
--
-- There's always exactly one
-- tab open on startup and then
-- 99% of use cases involve
-- opening more. Hiding the
-- tabline therefore causes a
-- layout shift almost every
-- time so just always show it
-- so the layouis stable.
vim.o.showtabline = 2

--------------------------------
-- plugins ---------------------
--------------------------------

vim.pack.add({
 "https://github.com/hrsh7th/nvim-cmp",
 "https://github.com/hrsh7th/cmp-cmdline",
 "https://github.com/hrsh7th/cmp-nvim-lsp",
 "https://github.com/lewis6991/gitsigns.nvim",
 "https://github.com/neovim/nvim-lspconfig",
 "https://github.com/nvim-treesitter/nvim-treesitter",
 "https://github.com/nvim-lua/plenary.nvim",
 "https://github.com/nvim-tree/nvim-web-devicons",
 "https://github.com/mason-org/mason.nvim",
 "https://github.com/mason-org/mason-lspconfig.nvim",
 "https://github.com/nvim-telescope/telescope.nvim",
 "https://github.com/jonarrien/telescope-cmdline.nvim",
 "https://github.com/nvim-telescope/telescope-ui-select.nvim",
 "https://github.com/nvimdev/lspsaga.nvim",
 "https://github.com/nvimtools/none-ls.nvim",
 "https://github.com/nvimtools/none-ls-extras.nvim",
 "https://github.com/nvim-tree/nvim-tree.lua",
 "https://github.com/folke/which-key.nvim",
 "https://github.com/maxmx03/solarized.nvim",
})

require("solarized").setup({
 transparent = {
  enabled = true,
  pmenu = true,
  normal = true,
  normalfloat = true,
  nvimtree = true,
  whichkey = true,
  telescope = true,
 },
 on_colors = function()
  return {
   base03 = "#06171d"
  }
 end,
 on_highlights = function(c, u)
  local blk = "#06171d"
  local gry = u.darken(c.base04, 5)
  gry = "#002B36"
  local brd = u.lighten(c.base04, 8)
  return {
   Normal = { fg = c.base3 },
   CursorLine = { bg = gry },
   CursorLineNr = { bg = gry },
   CursorLineSign = { bg = gry },
   LineNr = { bg = c.base03 },
   SignColumn = { bg = c.base03 },
   StatusLine = {
    bg = blk,
    fg = c.base01,
   },
   StatusLineNC = {
    bg = blk,
    fg = c.base01,
   },
   TabLineFill = { bg = blk },
   TabLine = { bg = blk },
   TabLineSel = { fg = "#fcf2d5" },
   TelescopeBorder = { fg = brd },
   TelescopeTitle = { bg = blk, fg = c.base3 },
   TelescopePromptNormal = { fg = c.base3 },
   TelescopePromptBorder = { fg = c.base1 },
  }
 end,
})

vim.cmd.colorscheme("solarized")

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
  ["<CR>"] = cmp.mapping(
   function(fallback)
    if cmp.visible() and cmp.get_selected_entry() then
     cmp.confirm({ select = false })
    else
     fallback()
    end
   end,
   { "i", "s" }
  ),
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

require("mason").setup()

require("mason-lspconfig").setup({
 ensure_installed = {
  "cssls",
  "lua_ls",
  "ts_ls",
 }
})

require("lspconfig").cssls.setup({})
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

-- require("telescope").load_extension("ui-select")

require("lspsaga").setup({
 symbol_in_winbar = { enable = false },
 lightbulb = {
  virtual_text = false,
 },
})

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
  "<leader>f",
  group = "Format",
 },
})

