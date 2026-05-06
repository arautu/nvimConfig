---@module 'oil'
---
--- Configuração modular do oil usando vim.pack (Neovim 0.12+)
--- Documentação: :h oil | https://github.com/stevearc/oil.nvim

-- ============================================================================
-- 1. Registro do plugin via vim.pack
-- ============================================================================
vim.pack.add({
  { src = 'https://github.com/nvim-tree/nvim-web-devicons' },
  { src = 'https://github.com/stevearc/oil.nvim' }
})

-- ============================================================================
-- 2. Setup
-- ============================================================================
require('oil').setup {
  columns = { 'icon' },
  view_options = {
    show_hidden = true,
  },
}

-- ============================================================================
-- 3. Atalhos de teclado
-- ============================================================================
vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
vim.keymap.set('n', '<space>-', require('oil').toggle_float, { desc = 'Open directory' })
