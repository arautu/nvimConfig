---@module 'nvim-treesitter'
---
--- Configuração modular do nvim-treesitter usando vim.pack (Neovim 0.12+)
--- Documentação: :h pack | https://github.com/nvim-treesitter/nvim-treesitter

-- ============================================================================
-- 1. Hook para atualizar os analisadores (parsers) do tree-sitter
-- ============================================================================
vim.api.nvim_create_autocmd('PackChanged', { callback = function(ev)
  local name, kind = ev.data.spec.name, ev.data.kind
  if name == 'nvim-treesitter' and kind == 'update' then
    if not ev.data.active then vim.cmd.packadd('nvim-treesitter') end
    vim.cmd('TSUpdate')
  end
end })

-- ============================================================================
-- 2. Registro do plugin via vim.pack (experimental, mas estável)
-- ============================================================================
vim.pack.add({
  "https://github.com/nvim-treesitter/nvim-treesitter",
})

-- ============================================================================
-- 3. Setup do nvim-treesitter
-- ============================================================================
require('nvim-treesitter').install { 'lua', 'vim', 'vimdoc', 'markdown', 'bash' }

-- ============================================================================
-- 4. Highlighting
-- ============================================================================
vim.api.nvim_create_autocmd('FileType', {
  pattern = { '<filetype>' },
  callback = function() vim.treesitter.start() end,
})
