-- render-markdown.nvim - render markdown inside the buffer itself
-- https://github.com/MeanderingProgrammer/render-markdown.nvim
--
-- Usage: open a markdown file and headings, bullets, code blocks, tables and
-- checkboxes are drawn in place with extmarks (no browser/preview window).
-- `:RenderMarkdown toggle` toggles the current buffer, `<leader>mr` all buffers.
--
-- Needs the treesitter `markdown`/`markdown_inline` parsers, which are already
-- in the SECTION 9 parser list of init.lua.

vim.pack.add { 'https://github.com/MeanderingProgrammer/render-markdown.nvim' }

require('render-markdown').setup {
  -- No image provider (image.nvim / latex2image.nvim) is installed, so LaTeX
  -- math would only print a warning instead of rendering.
  latex = { enabled = false },
}

vim.keymap.set('n', '<leader>mr', '<CMD>RenderMarkdown toggle<CR>', { desc = 'Markdown: toggle render', silent = true })
