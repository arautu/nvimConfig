---@module 'lsp'
---
--- Configuração modular do lsp usando vim.pack (Neovim 0.12+)
--- Documentação: :h lsp | https://neovim.io/doc/user/lsp/

-- ============================================================================
-- 1. Registro do plugin via vim.pack
-- ============================================================================
vim.pack.add({ 'https://github.com/neovim/nvim-lspconfig' })

-- ============================================================================
-- 2. Setup
-- ============================================================================
vim.lsp.enable({ 'lua_ls' })

-- ============================================================================
-- 3. Teclas de atalho LSP
-- ============================================================================
vim.keymap.set('n', '<leader>le', vim.diagnostic.open_float, { desc = 'Diagnósticos' })
vim.keymap.set('n', '<leader>lf', function()
  vim.lsp.buf.format({ async = true })
end, { desc = 'Formatar' })
