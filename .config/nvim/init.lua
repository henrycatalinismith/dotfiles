-- Use space as the leader key
--
-- Space is the biggest key on
-- a standard keyboard and
-- doesn't do anything by
-- default in normal mode.
vim.g.mapleader = " "

vim.keymap.set(
 "n",
 "<Tab>",
 ":tabnext<CR>",
 { noremap = true }
)
vim.keymap.set(
 "n",
 "<leader>q",
 ":q<CR>",
 { noremap = true }
)
vim.keymap.set(
 "n",
 "<leader>w",
 ":w<CR>",
 { noremap = true }
)

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

local function init()
 ui_enable_guicolors()
 ui_hide_tildes()
 ui_show_cursorline()
 ui_show_numbers()
 ui_show_signcolumn()
 ui_show_tabline()
end

init()
