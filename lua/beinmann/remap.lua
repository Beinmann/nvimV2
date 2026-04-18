-- k/j move by visual lines in visual mode (normal mode handled by kickstart with v:count guard)
vim.keymap.set('v', 'k', 'gk', { noremap = true, silent = true, desc = 'Move up by visual line' })
vim.keymap.set('v', 'j', 'gj', { noremap = true, silent = true, desc = 'Move down by visual line' })

vim.api.nvim_set_keymap('i', '<C-s>', '<ESC>:w<CR>', { noremap = true, silent = true, desc = 'Save file' })
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', { noremap = true, silent = true, desc = 'Save file' })

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = 'Open file explorer' })

local function close_or_explore()
  if vim.fn.winnr('$') > 1 then
    vim.cmd('wincmd q')
  else
    vim.cmd('Explore')
  end
end
vim.keymap.set('n', '<leader>q', close_or_explore, { noremap = true, silent = true, desc = 'Close window or open explorer' })

vim.keymap.set('n', '<leader><Tab>', '<C-^>', { noremap = true, silent = true, desc = 'Switch to last buffer' })
vim.keymap.set('n', '<leader>-', '<C-^>', { noremap = true, silent = true, desc = 'Switch to last buffer' })

vim.keymap.set('n', 'H', 'g0', { noremap = true, silent = true, desc = 'Go to start of visual line' })
vim.keymap.set('n', 'L', 'g$', { noremap = true, silent = true, desc = 'Go to end of visual line' })

vim.keymap.set('i', 'jk', '<Esc>', { noremap = true, silent = true, desc = 'Exit insert mode' })

vim.keymap.set('v', 'p', '"_dP', { noremap = true, silent = true, desc = 'Paste without yanking replaced text' })

vim.keymap.set('n', 'C', 'xi', { noremap = true, silent = true, desc = 'Delete char and insert' })

vim.keymap.set('n', 'x', '"_x', { noremap = true, silent = true, desc = 'Delete char without yanking' })

-- Buffer management
vim.keymap.set('n', '<leader>bl', ':ls<CR>:b<Space>', { noremap = true, desc = 'List buffers and switch' })
vim.keymap.set('n', '<leader>bb', ':enew<CR>', { noremap = true, silent = true, desc = 'Open new empty buffer' })

-- § mirrors @ for macro execution — easier to reach on some keyboards
vim.keymap.set('n', '§', '@', { noremap = true, silent = true, desc = 'Execute macro' })
