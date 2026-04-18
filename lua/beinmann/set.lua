-- Set from the Primeagen (might not keep all
-- vim.opt.guicursor = ""  -- Fat cursor (even in edit mode)

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

-- Might disable this again. This is for having no direct backups of files but a long undotree with the undotree plugin. I haven't tested this out yet. If the undotree would persist in between sessions without too much hassle that would be great
vim.opt.swapfile = false
vim.opt.backup = false
--vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir" -- From the original file (but I think it is meant for Unix like systems)
vim.opt.undodir = vim.fn.stdpath('data') .. '/undodir'
-- local undodir_path = vim.opt.undodir:get() -- Check if the undodir was correctly set (From ChatGPT)
-- print("Undodir Path:", undodir_path) -- Check if the undodir was correctly set (From ChatGPT)
-- print("Is Directory:", vim.fn.isdirectory(undodir_path)) -- Check if the undodir was correctly set (From ChatGPT)
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"    -- Don't know what this does
vim.opt.isfname:append("@-@") -- no idea what this does	

vim.opt.updatetime = 50       -- Fast update time (but no idea for what)

-- vim.opt.colorcolumn = "80"    -- Creates a column at 80 characters. might keep might not

vim.g.mapleader = " "





---- My own sets (a lot of them googled or from ChatGPT) ----

-- Vim uses windows clipboard
vim.o.clipboard = vim.o.clipboard .. 'unnamedplus'

vim.o.whichwrap = vim.o.whichwrap .. '<,>,h,l'

vim.opt.textwidth = 0

-- shows matching parentheses
-- vim.opt.showmatch = true

vim.opt.breakindent = true
vim.opt.showbreak = "++ "
vim.opt.linebreak = true

vim.opt.wrap = true

vim.opt.ignorecase = true

-- vim.opt.virtualedit = "all"
