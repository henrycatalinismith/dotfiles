vim.g.mapleader = " "

vim.o.number = true
vim.o.autoread = true
vim.o.numberwidth = 4
vim.o.signcolumn = "yes:2"
vim.o.updatetime = 250

vim.api.nvim_create_autocmd("FileType", {
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
})

vim.api.nvim_create_autocmd("FileType", {
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
})

vim.api.nvim_create_autocmd("FileType", {
 pattern = { "perl", "php" },
 callback = function()
  vim.opt_local.shiftwidth = 4
  vim.opt_local.tabstop = 4
  vim.opt_local.softtabstop = 4
  vim.opt_local.expandtab = true
 end,
})

vim.keymap.set("n", "<leader><leader>", ":Telescope cmdline<CR>", {})
vim.keymap.set("n", "<leader>f", ":Telescope find_files<CR>", {})
vim.keymap.set("n", "<leader>q", ":q<CR>", {})
vim.keymap.set("n", "<leader>w", ":w<CR>", {})
vim.keymap.set("n", "gd", ":Lspsaga goto_definition<CR>", {})
vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {})
vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, {})
vim.keymap.set("n", "<leader>h", vim.lsp.buf.references, {})
vim.keymap.set("n", "<leader>k", ":Lspsaga hover_doc<CR>", {})
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, {})
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, {})
vim.keymap.set("n", "<leader>b", ":Telescope buffers<CR>", {})
vim.keymap.set("n", "<leader>/", ":Telescope live_grep<CR>", {})
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", {})
vim.keymap.set("n", "<leader>?", ":Telescope commands<CR>", {})
vim.keymap.set("n", "<leader>s", ":Telescope lsp_document_symbols<CR>", {})
vim.keymap.set("n", "<leader>S", ":Telescope lsp_workspace_symbols<CR>", {})
vim.keymap.set("n", "<leader>d", ":Telescope diagnostics bufnr=0<CR>", {})
vim.keymap.set("n", "<leader>D", ":Telescope diagnostics<CR>", {})
vim.keymap.set("n", "<leader>=", vim.lsp.buf.format, {})
vim.keymap.set("n", "<leader>g", ":Telescope git_status<CR>", {})
vim.keymap.set("n", "<leader>i", function()
 vim.lsp.inlay_hint.enable(
  not vim.lsp.inlay_hint.is_enabled({ bufnr = 0 }),
  { bufnr = 0 }
 )
end, {})
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
vim.keymap.set("n", "gy", vim.lsp.buf.type_definition, {})
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
vim.keymap.set("n", "<Tab>", ":tabnext<CR>", {})
vim.keymap.set("n", "<S-Tab>", ":tabprev<CR>", {})

vim.pack.add({
 "https://github.com/lewis6991/gitsigns.nvim",
 "https://github.com/neovim/nvim-lspconfig",
 "https://github.com/nvim-treesitter/nvim-treesitter",
 "https://github.com/stevearc/conform.nvim",
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
 "https://github.com/j-hui/fidget.nvim",
 "https://github.com/nvim-lualine/lualine.nvim",
 "https://github.com/saghen/blink.lib",
 "https://github.com/saghen/blink.cmp",
 })

require("fidget").setup({})

require("blink.cmp").setup({
 keymap = {
  preset = "default",
 },
 appearance = {
  nerd_font_variant = "mono",
 },
 completion = {
  documentation = {
   auto_show = true,
  },
 },
 sources = {
  default = { "lsp", "path", "buffer" },
 },
 signature = {
  enabled = true,
 },
})

require("lualine").setup({
 options = {
  theme = "auto",
  component_separators = "",
  section_separators = "",
 },
 sections = {
  lualine_a = { "mode" },
  lualine_b = { "branch", "diff", "diagnostics" },
  lualine_c = { "filename" },
  lualine_x = { "lsp_status", "filetype" },
  lualine_y = { "progress" },
  lualine_z = { "location" },
 },
})

require("lspsaga").setup({
 symbol_in_winbar = { enable = false },
 lightbulb = {
  virtual_text = false,
 },
})

vim.diagnostic.config({
 virtual_text = {
  current_line = false,
 },
 virtual_lines = {
  current_line = true,
 },
})

require("mason").setup()

vim.lsp.config("*", {
 capabilities = require("blink.cmp").get_lsp_capabilities(),
})

vim.lsp.config("lua_ls", {
 settings = {
  Lua = {
   runtime = {
    version = "LuaJIT",
   },
   diagnostics = {
    globals = { "vim" },
   },
   workspace = {
    library = {
     vim.env.VIMRUNTIME .. "/lua",
    },
    checkThirdParty = false,
   },
   telemetry = {
    enable = false,
   },
  },
 },
})

require("conform").setup({
 formatters_by_ft = {
  css = { "prettier" },
  html = { "prettier" },
  javascript = { "prettier" },
  javascriptreact = { "prettier" },
  json = { "prettier" },
  jsonc = { "prettier" },
  markdown = { "prettier" },
  scss = { "prettier" },
  typescript = { "prettier" },
  typescriptreact = { "prettier" },
 },
})

vim.keymap.set("n", "<leader>=", function()
 require("conform").format({ async = true, lsp_format = "never" })
end, { desc = "Format buffer" })

require("mason-lspconfig").setup({
 ensure_installed = {
  "cssls",
  "html",
  "jsonls",
  "lua_ls",
  "tailwindcss",
  "ts_ls",
 }
})

require("gitsigns").setup({
 current_line_blame = true,
 current_line_blame_opts = {
  delay = 32,
  virt_text_pos = "right_align",
 },
})

local treesitter = require("nvim-treesitter")
if treesitter.setup then
 treesitter.setup({})
else
 require("nvim-treesitter.configs").setup({
  highlight = { enable = true },
  indent = { enable = true },
 })
end

vim.api.nvim_create_autocmd("FileType", {
 callback = function(args)
  pcall(vim.treesitter.start, args.buf)
 end,
})

require("telescope").setup({
 pickers = {
  find_files = {
   hidden = true,
  },
 },
})

require("telescope").load_extension("cmdline")
require("telescope").load_extension("ui-select")

require("null-ls").setup({
 sources = {
  require("none-ls.code_actions.eslint_d"),
  require("none-ls.diagnostics.eslint_d"),
 },
})

require("nvim-tree").setup({
 update_focused_file = {
  enable = true,
 },
})

local wk = require("which-key")
wk.setup({
 triggers = { "<leader>", "g" },
})
