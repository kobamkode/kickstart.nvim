return {
  {
    'olimorris/codecompanion.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'ravitemer/mcphub.nvim',
      'ravitemer/codecompanion-history.nvim',
    },
    opts = {
      interactions = {
        chat = {
          adapter = 'anthropic',
        },
        inline = {
          adapter = 'anthropic',
        },
      },
      adapters = {
        http = {
          env = {
            api_key = function()
              return os.getenv 'ANTHROPIC_API_KEY'
            end,
          },
        },
      },
      rules = {
        default = {
          description = 'Collection of common files for all projects',
          files = {
            '.clinerules',
            '.cursorrules',
            '.goosehints',
            '.rules',
            '.windsurfrules',
            '.github/copilot-instructions.md',
            'AGENT.md',
            'AGENTS.md',
            { path = 'CLAUDE.md', parser = 'claude' },
            { path = 'CLAUDE.local.md', parser = 'claude' },
            { path = '~/.claude/CLAUDE.md', parser = 'claude' },
          },
          is_preset = true,
        },
        opts = {
          chat = {
            enabled = true,
            default_rules = 'default', -- The rule groups to load
            autoload = { 'default' },
          },
        },
      },
      extensions = {
        history = {
          enabled = true,
          opts = {},
        },
      },
    },
  },
  {
    'echasnovski/mini.diff',
    config = function()
      local diff = require 'mini.diff'
      diff.setup {
        source = diff.gen_source.none(),
      }
    end,
  },
}
