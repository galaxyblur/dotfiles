vim.cmd("let g:netrw_liststyle = 3")

vim.g.mapleader = " "

local opt = vim.opt

opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

opt.wrap = false

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

opt.cursorline = true

opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
opt.swapfile = false

-- Navigate vim panes better
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>", { desc = "Go to top window" })
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>", { desc = "Go to bottom window" })
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>", { desc = "Go to left window" })
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>", { desc = "Go to right window" })

-- window management
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
vim.keymap.set("n", "<leader>sc", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

vim.keymap.set("n", "[b", ":BufferLineCyclePrev<CR>", { desc = "Go to previous buffer" })
vim.keymap.set("n", "]b", ":BufferLineCycleNext<CR>", { desc = "Go to next buffer" })
vim.keymap.set("n", "<Leader>bd", ":bd<CR>", { desc = "Close current buffer" })

vim.keymap.set("n", "<Leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
