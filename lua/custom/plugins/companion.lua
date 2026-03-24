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
          files = {
            'AGENTS.md',
          },
          is_preset = true,
        },
        opts = {
          chat = {
            enabled = true,
            default_rules = 'default',
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
}
