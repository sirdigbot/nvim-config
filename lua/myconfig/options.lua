vim.g.mapleader = " "
vim.g.maplocalleader = "\\"


-- Line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Indentation / Appearance
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false

vim.opt.termguicolors = true
--vim.opt.colorcolumn = "80"

-- Don't keep backups, but store undo tree persistently
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") or os.getenv("USERPROFILE") .. "/.vim/undodir"
vim.opt.undofile = true

-- Search
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Case-insensitive search unless \C or a capital letter is used
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Better completion
vim.opt.completeopt = 'menuone,noselect'

-- Keep margin when scrolling
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- No mouse--we ballin'
vim.opt.mouse = ''

-- ????
vim.opt.updatetime = 50
