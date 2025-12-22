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
        mcphub = {
          callback = 'mcphub.extensions.codecompanion',
          opts = {
            make_vars = true,
            make_slash_commands = true,
            show_result_in_chat = true,
          },
        },
        history = {
          enabled = true,
          opts = {},
        },
        vectorcode = {
          opts = {
            tool_group = {
              enabled = true,
              extras = {},
              collapse = false, -- whether the individual tools should be shown in the chat
            },
            tool_opts = {
              ['*'] = {},
              ls = {},
              vectorise = {},
              query = {
                max_num = { chunk = -1, document = -1 },
                default_num = { chunk = 50, document = 10 },
                include_stderr = false,
                use_lsp = false,
                no_duplicate = true,
                chunk_mode = false,
                summarise = {
                  enabled = false,
                  adapter = nil,
                  query_augmented = true,
                },
              },
              files_ls = {},
              files_rm = {},
            },
          },
        },
      },
    },
  },
  {
    'ravitemer/mcphub.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    build = 'npm install -g mcp-hub@latest',
    opts = {},
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    ft = { 'markdown', 'codecompanion' },
    opts = { enabled = true, preset = 'lazy' },
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
  {
    'Davidyz/VectorCode',
    version = '*',
    dependencies = { 'nvim-lua/plenary.nvim' },
    cmd = 'VectorCode',
  },
}
