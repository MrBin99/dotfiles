-- -------------------------------------------------------------------------- --
--                  General Neovim settings and configuration                 --
-- -------------------------------------------------------------------------- --

local g = vim.g
local opt = vim.opt
local keymap = vim.keymap

-- --------------------------------- General -------------------------------- --

opt.mouse = "r" -- Remove mouse popup
opt.clipboard = "unnamedplus" -- Copy/paste to system clipboard
opt.swapfile = false -- Don't use swapfile
opt.completeopt = "menuone,noinsert,noselect" -- Autocomplete options
opt.timeout = true -- Enable timeout for multi-keys keybindings
opt.timeoutlen = 300 -- Set timeout length for multi-keys keybindings

-- ----------------------------------- UI ----------------------------------- --

opt.number = true -- Show line number
opt.relativenumber = true -- Show relative line number
opt.cursorline = true -- Highlight current line
opt.wrap = false -- Disable line wrap
opt.showmatch = true -- Highlight matching parenthesis
opt.foldmethod = "marker" -- Enable folding (default 'foldmarker')
opt.colorcolumn = "80" -- Line lenght marker at 80 columns
opt.splitright = true -- Vertical split to the right
opt.splitbelow = true -- Horizontal split to the bottom
opt.linebreak = true -- Wrap on word boundary
opt.termguicolors = true -- Enable 24-bit RGB colors
opt.laststatus = 3 -- Set global statusline
opt.scrolloff = 20 -- Show 20 lines when scrolling

-- ------------------------------ Tabs, indent ------------------------------ --

opt.expandtab = true -- Use spaces instead of tabs
opt.shiftwidth = 2 -- Shift 2 spaces when tab
opt.tabstop = 2 -- 1 tab == 2 spaces
opt.smartindent = true -- Autoindent new lines

-- ------------------------------- Memory, CPU ------------------------------ --

opt.hidden = true -- Enable background buffers
opt.history = 100 -- Remember N lines in history
opt.lazyredraw = true -- Faster scrolling
opt.synmaxcol = 240 -- Max column for syntax highlight
opt.updatetime = 250 -- ms to wait for trigger an event
keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>") -- Clear search

-- ----------------------------- Search, replace ---------------------------- --

opt.incsearch = true -- Incremental search
opt.hlsearch = true -- Highlight search results
opt.ignorecase = true -- Ignore case letters when search
opt.smartcase = true -- Ignore lowercase for the whole pattern

-- ------------------------------- Backup, undo ----------------------------- --

opt.backup = false -- Disable backup
opt.writebackup = false -- Disable backup

-- ------------------------------- File encoding ---------------------------- --

opt.encoding = "UTF-8" -- Set encoding to UTF-8
opt.fileencoding = "UTF-8" -- Set file encoding to UTF-8
opt.fileencodings = "utf-8,latin1" -- Set file encoding to UTF-8
opt.eol = true -- End of line

-- ------------------------------- File format ------------------------------ --

opt.fileformat = "unix" -- Set file format to Unix
opt.fileformats = "unix,dos,mac" -- Set file format to Unix

-- ------------------------------- File options ----------------------------- --

opt.autoread = true -- Auto read file when changed
