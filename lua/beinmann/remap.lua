-- k/j move by visual lines in visual mode (normal mode handled by kickstart with v:count guard)
vim.keymap.set('v', 'k', 'gk', { noremap = true, silent = true, desc = 'Move up by visual line' })
vim.keymap.set('v', 'j', 'gj', { noremap = true, silent = true, desc = 'Move down by visual line' })

-- Remap Ctrl S to saving the file (Usually Ctrl s is used for pausing output of the console or something
vim.api.nvim_set_keymap('i', '<C-s>', '<ESC>:w<CR>', { noremap = true, silent = true, desc = 'Save file' })
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', { noremap = true, silent = true, desc = 'Save file' })

-- Remap Enter (Carriage Return) to creating a new line below the current one
	-- Side Note: If I keep this I could also make it have the normal
	-- behaviour of creating a new line from the current pos
-- vim.api.nvim_set_keymap('n', '<CR>', 'o<ESC>', { noremap = true, silent = true })

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = 'Open file explorer' })

-- TODO these are my attempts at trying to remap something (like <leader>e) to confirming the selection so you don't have to reach for enter over and over again
-- vim.keymap.set("n", "<leader>e", function() vim.ui.confirm() end, opts)

-- Set <leader>e to be the same as pressing Enter (From ChatGPT)
-- vim.api.nvim_set_keymap('n', '<leader>e', , { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>e', ':<C-u>call feedkeys("\\<CR>", "n")<CR>', { noremap = true, silent = true })


-- <leader>q Slightly more complicated function (From ChatGPT)
-- When pressing that combinations if there are multiple windows open then call :q
-- otherwise call :Ex
local function close_or_explore()
  if vim.fn.winnr('$') > 1 then
    vim.cmd('wincmd q')
  else
    vim.cmd('Explore')
  end
end
vim.keymap.set('n', '<leader>q', close_or_explore, { noremap = true, silent = true, desc = 'Close window or open explorer' })

-- Switch to last used buffer
vim.keymap.set('n', '<leader><Tab>', '<C-^>', { noremap = true, silent = true, desc = 'Switch to last buffer' })
vim.keymap.set('n', '<leader>-', '<C-^>', { noremap = true, silent = true, desc = 'Switch to last buffer' })

-- H/L go to start/end of visual line
vim.keymap.set('n', 'H', 'g0', { noremap = true, silent = true, desc = 'Go to start of visual line' })
vim.keymap.set('n', 'L', 'g$', { noremap = true, silent = true, desc = 'Go to end of visual line' })

-- jk exits insert mode
vim.keymap.set('i', 'jk', '<Esc>', { noremap = true, silent = true, desc = 'Exit insert mode' })

-- Paste in visual mode without yanking the replaced text
vim.keymap.set('v', 'p', '"_dP', { noremap = true, silent = true, desc = 'Paste without yanking replaced text' })

-- C deletes current char and enters insert mode
vim.keymap.set('n', 'C', 'xi', { noremap = true, silent = true, desc = 'Delete char and insert' })

-- x deletes without yanking
vim.keymap.set('n', 'x', '"_x', { noremap = true, silent = true, desc = 'Delete char without yanking' })

-- Buffer management
vim.keymap.set('n', '<leader>bl', ':ls<CR>:b<Space>', { noremap = true, desc = 'List buffers and switch' })
vim.keymap.set('n', '<leader>bb', ':enew<CR>', { noremap = true, silent = true, desc = 'Open new empty buffer' })

-- § acts as @ (macro execute) — easier to reach on some keyboards
vim.keymap.set('n', '§', '@', { noremap = true, silent = true, desc = 'Execute macro' })

