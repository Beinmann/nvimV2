-- Set k and j to go up and down visual lines (instead of actual lines). Mostly relevant if there are line wraps
-- TODO learn what the difference between noremap and nnoremap is and what the <silent> does here
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'k', 'gk', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'j', 'gj', { noremap = true, silent = true })

-- Makes it so you can also start (:) commands by simply pressing space (might change)
vim.api.nvim_set_keymap('n', '<space>', ':', { noremap = true, silent = true })

-- Remap Ctrl S to saving the file (Usually Ctrl s is used for pausing output of the console or something
vim.api.nvim_set_keymap('i', '<C-s>', '<ESC>:w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', { noremap = true, silent = true })

-- Remap Enter (Carriage Return) to creating a new line below the current one
	-- Side Note: If I keep this I could also make it have the normal
	-- behaviour of creating a new line from the current pos
-- vim.api.nvim_set_keymap('n', '<CR>', 'o<ESC>', { noremap = true, silent = true })

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) -- From ThePrimeagen

-- TODO these are my attempts at trying to remap something (like <leader>e) to confirming the selection so you don't have to reach for enter over and over again
-- vim.keymap.set("n", "<leader>e", function() vim.ui.confirm() end, opts)

-- Set <leader>e to be the same as pressing Enter (From ChatGPT)
-- vim.api.nvim_set_keymap('n', '<leader>e', , { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>e', ':<C-u>call feedkeys("\\<CR>", "n")<CR>', { noremap = true, silent = true })


-- <leader>q Slightly more complicated function (From ChatGPT)
-- When pressing that combinations if there are multiple windows open then call :q
-- otherwise call :Ex
vim.api.nvim_set_keymap('n', '<leader>q', ':lua CloseOrExplore()<CR>', { noremap = true, silent = true })

function CloseOrExplore()
  if vim.fn.winnr('$') > 1 then
    vim.cmd('wincmd q')
  else
    vim.cmd('Explore')
  end
end


vim.api.nvim_set_keymap('n', 'K', '10k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'K', '10k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'J', '10j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'J', '10j', { noremap = true, silent = true })
