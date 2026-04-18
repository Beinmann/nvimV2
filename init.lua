require("beinmann")
require("other")

-- local vimrc = "./vimrc.vim"
-- vim.cmd.source(vimrc) 

local config_dir = vim.fn.stdpath('config')
local vim_file_path = config_dir .. "/vimscript/beinmann/autocmd.vim"
vim.cmd("source " .. vim_file_path)
