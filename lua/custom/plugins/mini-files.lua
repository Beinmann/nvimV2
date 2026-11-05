-- Ranger-like file navigation (miller columns: parent | current | preview).
-- h = go to parent, l = enter directory / open file, j/k = move.
-- Edit the buffer to rename/delete/create entries, then `=` to apply.
return {
  {
    'echasnovski/mini.files',
    version = false,
    dependencies = {
      {
        'echasnovski/mini.icons',
        -- Default folder glyph (U+F024B) is outside the BMP and often missing from
        -- terminal font fallbacks; use the Font Awesome folder (U+F07B) instead.
        opts = {
          default = {
            directory = { glyph = '\u{f07b}' },
          },
        },
      },
    },
    keys = {
      {
        '<leader>pv',
        function()
          local mf = require('mini.files')
          -- open at the current file; fall back to cwd for unnamed/non-file buffers
          if not mf.close() then
            local path = vim.api.nvim_buf_get_name(0)
            if path == '' or vim.fn.filereadable(path) == 0 then
              path = nil
            end
            mf.open(path, false)
          end
        end,
        desc = 'Open file explorer',
      },
    },
    opts = {
      mappings = {
        go_in = 'L', -- enter directory, keep explorer open
        go_in_plus = 'l', -- enter directory / open file and close explorer
        go_out = 'H', -- parent, keep cursor in place
        go_out_plus = 'h', -- parent
      },
      windows = { preview = true, width_focus = 30, width_nofocus = 20, width_preview = 50 },
    },
  },
}
