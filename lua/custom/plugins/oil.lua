-- oil.nvim - edit your filesystem like a normal buffer
-- https://github.com/stevearc/oil.nvim
--
-- Usage: `-` opens the current file's directory, `<leader>-` opens a floating
-- browser at the cwd. Inside the oil buffer edits are just buffer edits:
-- change/rename/delete lines, then `:w` to apply.

vim.pack.add { 'https://github.com/stevearc/oil.nvim' }

require('oil').setup {
  -- Keep the listing minimal; add 'permissions'/'size'/'mtime' if wanted.
  columns = { 'icon' },
  -- Show dotfiles so config files are reachable.
  view_options = { show_hidden = true },
  -- Preview the file under the cursor in a floating window.
  preview = {
    max_width = 0.9,
    max_height = 0.9,
    border = 'rounded',
  },
  -- Oil takes over directory buffers (e.g. `:e .`, `nvim .`), so netrw is not used.
  default_file_explorer = true,
  -- Start from oil's defaults, with a couple of small additions.
  keymaps = {
    ['g?'] = { 'actions.show_help', mode = 'n' },
    ['<CR>'] = 'actions.select',
    ['<C-s>'] = { 'actions.select', opts = { vertical = true }, mode = 'n' },
    ['<C-h>'] = { 'actions.select', opts = { horizontal = true }, mode = 'n' },
    ['<C-t>'] = { 'actions.select', opts = { tab = true }, mode = 'n' },
    ['<C-p>'] = 'actions.preview',
    ['<C-c>'] = { 'actions.close', mode = 'n' },
    ['q'] = { 'actions.close', mode = 'n' },
    ['<C-l>'] = 'actions.refresh',
    ['-'] = { 'actions.parent', mode = 'n' },
    ['_'] = { 'actions.open_cwd', mode = 'n' },
    ['`'] = { 'actions.cd', mode = 'n' },
    ['gs'] = { 'actions.change_sort', mode = 'n' },
    ['gx'] = 'actions.open_external',
    ['g.'] = { 'actions.toggle_hidden', mode = 'n' },
    ['g\\'] = { 'actions.toggle_trash', mode = 'n' },
    ['gy'] = { 'actions.yank_entry', mode = { 'n', 'v' } },
    ['<C-q>'] = { 'actions.send_to_qflist', mode = 'n' },
  },
}

-- Open the directory containing the current buffer (or the cwd for unnamed buffers).
vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Oil: open file browser', silent = true })

-- Floating browser rooted at the cwd.
vim.keymap.set('n', '<leader>-', function() require('oil').open_float(vim.fn.getcwd()) end, { desc = 'Oil: open floating browser', silent = true })
