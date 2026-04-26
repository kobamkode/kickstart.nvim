return {
  'mrcjkb/rustaceanvim',
  version = '^9',
  lazy = false,
  init = function()
    vim.g.rustaceanvim = {
      server = {
        default_settings = {
          ['rust-analyzer'] = {
            procMacro = {
              enable = true,
              ignored = {
                leptos_macro = {
                  -- 'component',
                  'server',
                },
              },
            },
            cargo = {
              features = 'all',
            },
            diagnostics = {
              disabled = { 'unresolved-proc-macro' },
              experimental = {
                enable = true,
              },
            },
            checkOnSave = {
              command = 'clippy',
            },
          },
        },
      },
    }
  end,
}
