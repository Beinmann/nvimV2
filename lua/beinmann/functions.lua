Autosave_enabled = false

function _G.toggle_autosave()
  if Autosave_enabled then
    vim.api.nvim_set_keymap('i', '<C-c>', '<C-c>', { noremap = true, silent = true })
    vim.cmd('autocmd! AutoSaveGroup')
    Autosave_enabled = false
    print("AutoSave disabled")
  else
    vim.api.nvim_set_keymap('i', '<C-c>', '<C-o>:update<CR><C-c>', { noremap = true, silent = true })
    vim.cmd('augroup AutoSaveGroup')
    vim.cmd('autocmd!')
    vim.cmd('autocmd InsertLeave * update')
    vim.cmd('augroup END')
    Autosave_enabled = true
    print("AutoSave enabled")
  end
end

vim.api.nvim_create_user_command('ToggleAutoSave', toggle_autosave, {})
