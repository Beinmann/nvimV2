-- NOTE: leader must be set before plugins are loaded
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.stdpath('data') .. '/undodir'
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.o.clipboard = 'unnamedplus'

vim.o.whichwrap = vim.o.whichwrap .. '<,>,h,l'

vim.opt.textwidth = 0

vim.opt.breakindent = true
vim.opt.showbreak = "++ "
vim.opt.linebreak = true

vim.opt.wrap = true

vim.opt.ignorecase = true
