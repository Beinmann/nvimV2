-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'folke/persistence.nvim',
    lazy = false,
    opts = {},
    config = function()
      require('persistence').setup()
      -- Auto-restore session when opening nvim with no file arguments
      local function discard_session()
        require('persistence').stop()
        local session_dir = vim.fn.stdpath('state') .. '/sessions/'
        local session_file = session_dir .. vim.fn.getcwd():gsub('/', '%%') .. '.vim'
        if vim.fn.filereadable(session_file) == 1 then
          vim.fn.delete(session_file)
        end
      end

      vim.keymap.set('n', '<leader>qd', function()
        discard_session()
        vim.cmd('qa')
      end, { desc = '[Q]uit: [D]iscard session' })

      vim.api.nvim_create_user_command('Qd', function(opts)
        discard_session()
        vim.cmd(opts.bang and 'qa!' or 'qa')
      end, { bang = true })

      vim.cmd('cnoreabbrev qd Qd')
      vim.cmd('cnoreabbrev qd! Qd!')

      vim.api.nvim_create_autocmd('VimEnter', {
        nested = true,
        callback = function()
          if vim.fn.argc() == 0 then
            require('persistence').load()
          end
        end,
      })
    end,
  },
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local harpoon = require('harpoon')
      harpoon:setup()

      vim.keymap.set('n', '<leader>a', function() harpoon:list():add() end, { desc = 'Harpoon [A]dd file' })
      vim.keymap.set('n', '<leader>he', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = '[H]arpoon m[E]nu' })

      vim.keymap.set('n', '<leader>1', function() harpoon:list():select(1) end, { desc = 'Harpoon file 1' })
      vim.keymap.set('n', '<leader>2', function() harpoon:list():select(2) end, { desc = 'Harpoon file 2' })
      vim.keymap.set('n', '<leader>3', function() harpoon:list():select(3) end, { desc = 'Harpoon file 3' })
      vim.keymap.set('n', '<leader>4', function() harpoon:list():select(4) end, { desc = 'Harpoon file 4' })
      vim.keymap.set('n', '<leader>5', function() harpoon:list():select(5) end, { desc = 'Harpoon file 5' })
    end,
  },
}
