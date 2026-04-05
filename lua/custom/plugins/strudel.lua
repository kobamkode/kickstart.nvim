return {
  'Goshujinsama/nvim-strudel',
  ft = 'strudel',
  build = 'cd server && npm install && npm run build',
  keys = {
    { '<S-CR>', '<cmd>StrudelEval<cr>', ft = 'strudel', desc = 'Strudel: Eval' },
    { '<leader>ss', '<cmd>StrudelStop<cr>', ft = 'strudel', desc = 'Strudel: Stop' },
    { '<leader>sp', '<cmd>StrudelPianoroll<cr>', ft = 'strudel', desc = 'Strudel: Pianoroll' },
    { '<leader>st', '<cmd>StrudelTheory<cr>', desc = 'Chord suggestions' },
    { 'v', '<leader>st', '<cmd>StrudelTheory selection<cr>', desc = 'Chord suggestions (selection)' },
    { '<leader>sa', '<cmd>StrudelAnalyze<cr>', desc = 'Analyze key/scale' },
  },
  config = function()
    require('strudel').setup()

    vim.api.nvim_create_autocmd('BufWritePost', {
      pattern = '*.strudel',
      callback = function()
        vim.cmd 'StrudelEval'
      end,
    })

    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'strudel',
      callback = function()
        vim.bo.commentstring = '// %s'
      end,
    })
  end,
}
