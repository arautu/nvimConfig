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
-- 4. Destaques (Highlighting)
-- ============================================================================
vim.api.nvim_create_autocmd('FileType', {
  pattern = { '<filetype>' },
  callback = function()
    vim.treesitter.start()
  end,
})

-- ============================================================================
-- 5. Dobras (Folds)
-- ============================================================================
vim.api.nvim_create_autocmd('FileType', {
  pattern = { '*' },
  callback = function()
    if vim.treesitter.language.get_lang(vim.bo.filetype) then
      vim.wo.foldmethod = 'expr'
      vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
      vim.wo.foldlevel = 99
    end
  end,
})

-- ============================================================================
-- 6. INDENTAÇÃO (EXPERIMENTAL)
-- ============================================================================
vim.api.nvim_create_autocmd('FileType', {
  pattern = { '*' },
  callback = function()
    if vim.treesitter.language.get_lang(vim.bo.filetype) then
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})
