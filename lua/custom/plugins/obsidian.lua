return {
  'obsidian-nvim/obsidian.nvim',
  version = '*', -- use latest release, remove to use latest commit
  ---@module 'obsidian'
  ---@type obsidian.config
  opts = {
    legacy_commands = false, -- this will be removed in the next major release
    workspaces = {
      {
        name = 'personal',
        path = '~/dev/notes',
      },
    },
    daily_notes = {
      enabled = true,
      folder = 'journal',
      date_format = 'YYYY-MM-DD',
      template = 'templates/daily.md',
    },
    templates = {
      enabled = true,
      folder = 'templates',
      date_format = 'YYYY-MM-DD',
      time_format = 'HH:mm',
    },
    open_notes_in = 'current',
    callbacks = {
      enter_note = function(note)
        vim.keymap.set('n', '<leader>ch', '<cmd>Obsidian toggle_checkbox<cr>', {
          buffer = true,
          desc = 'Toggle checkbox',
        })
      end,
    },
  },
}
