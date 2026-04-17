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
      substitutions = {
        prev_daily = function()
          local today = os.date '%Y-%m-%d'
          local files = vim.fn.glob(vim.fn.expand '~/dev/notes/journal/' .. '**/*.md', false, true)
          local dates = {}
          for _, f in ipairs(files) do
            local date = f:match '(%d%d%d%d%-%d%d%-%d%d)%.md$'
            if date and date < today then table.insert(dates, date) end
          end
          table.sort(dates)
          return dates[#dates] or os.date('%Y-%m-%d', os.time() - 86400)
        end,

        next_daily = function()
          local today = os.date '%Y-%m-%d'
          local files = vim.fn.glob(vim.fn.expand '~/dev/notes/journal/' .. '**/*.md', false, true)
          local dates = {}
          for _, f in ipairs(files) do
            local date = f:match '(%d%d%d%d%-%d%d%-%d%d)%.md$'
            if date and date > today then table.insert(dates, date) end
          end
          table.sort(dates)
          return dates[1] or os.date('%Y-%m-%d', os.time() + 86400)
        end,
      },
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
