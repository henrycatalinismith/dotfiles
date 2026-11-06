vim.g.mapleader = " "

vim.o.exrc = true
vim.o.number = true
vim.o.autoread = true
vim.o.numberwidth = 4
vim.o.signcolumn = "yes:2"
vim.o.updatetime = 250
vim.opt.fillchars:append({ eob = " " })

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

vim.keymap.set("n", "<leader><leader>", ":Telescope cmdline<CR>", { desc = "Command history" })
vim.keymap.set("n", "<leader>f", ":Telescope find_files<CR>", { desc = "Find files" })
vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit window" })
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { desc = "Rename symbol" })
vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, { desc = "Code actions" })
vim.keymap.set("n", "<leader>h", vim.lsp.buf.references, { desc = "Find references" })
vim.keymap.set("n", "<leader>k", ":Lspsaga hover_doc<CR>", { desc = "Show documentation" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, {})
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, {})
vim.keymap.set("n", "<leader>b", ":Telescope buffers<CR>", { desc = "Switch buffers" })
vim.keymap.set("n", "<leader>/", ":Telescope live_grep<CR>", { desc = "Search in files" })
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
vim.keymap.set("n", "<leader>?", ":Telescope commands<CR>", { desc = "Browse commands" })
vim.keymap.set("n", "<leader>s", ":Telescope lsp_document_symbols<CR>", { desc = "Document symbols" })
vim.keymap.set("n", "<leader>S", ":Telescope lsp_workspace_symbols<CR>", { desc = "Workspace symbols" })
vim.keymap.set("n", "<leader>d", ":Telescope diagnostics bufnr=0<CR>", { desc = "Buffer diagnostics" })
vim.keymap.set("n", "<leader>D", ":Telescope diagnostics<CR>", { desc = "Workspace diagnostics" })
vim.keymap.set("n", "<leader>=", vim.lsp.buf.format, { desc = "Format buffer" })
vim.keymap.set("n", "<leader>g", ":Telescope git_status<CR>", { desc = "Git status" })
vim.keymap.set("n", "<leader>i", function()
 vim.lsp.inlay_hint.enable(
  not vim.lsp.inlay_hint.is_enabled({ bufnr = 0 }),
  { bufnr = 0 }
 )
end, { desc = "Toggle inlay hints" })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
vim.keymap.set("n", "gy", vim.lsp.buf.type_definition, {})
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
vim.keymap.set("n", "<Tab>", ":tabnext<CR>", {})
vim.keymap.set("n", "<S-Tab>", ":tabprev<CR>", {})

vim.pack.add({
 "https://github.com/lewis6991/gitsigns.nvim",
 "https://github.com/neovim/nvim-lspconfig",
 { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
 "https://github.com/stevearc/conform.nvim",
 "https://github.com/nvim-lua/plenary.nvim",
 "https://github.com/nvim-tree/nvim-web-devicons",
 "https://github.com/mason-org/mason.nvim",
 "https://github.com/mason-org/mason-lspconfig.nvim",
 "https://github.com/nvim-telescope/telescope.nvim",
 "https://github.com/jonarrien/telescope-cmdline.nvim",
 "https://github.com/nvim-telescope/telescope-ui-select.nvim",
 "https://github.com/nvimdev/lspsaga.nvim",
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
  "eslint",
  "html",
  "jsonls",
  "lua_ls",
  "tailwindcss",
  "ts_ls",
 }
})

vim.lsp.enable({ "oxlint", "eslint" })

require("gitsigns").setup({
 current_line_blame = true,
 current_line_blame_opts = {
  delay = 32,
  virt_text_pos = "right_align",
 },
})

require("nvim-treesitter").setup({})

vim.api.nvim_create_autocmd("FileType", {
 callback = function(args)
  if pcall(vim.treesitter.start, args.buf) then
   vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end
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

require("nvim-tree").setup({
 update_focused_file = {
  enable = true,
 },
 sort = {
  sorter = function(nodes)
   if vim.g.nvim_tree_reverse_sort then
    table.sort(nodes, function(a, b) return a.name > b.name end)
    return
   end
   return "name"
  end,
 },
})

local wk = require("which-key")
wk.setup({
 triggers = { "<leader>", "g" },
})

vim.api.nvim_create_user_command("ReloadConfig", function()
 vim.cmd.source(vim.env.MYVIMRC)
 vim.notify("Config reloaded")
end, { desc = "Reload init.lua" })
