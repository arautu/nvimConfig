---@module 'nvim-treesitter'
---
--- Configuração modular do nvim-treesitter usando vim.pack (Neovim 0.12+)
--- Documentação: :h pack | https://github.com/nvim-treesitter/nvim-treesitter

-- ============================================================================
-- 1. Registro do plugin via vim.pack (experimental, mas estável)
-- ============================================================================
vim.pack.add({
  "https://github.com/nvim-treesitter/nvim-treesitter",
})

-- ============================================================================
-- 2. Setup do nvim-treesitter
-- ============================================================================
local ts_status, treesitter = pcall(require, "nvim-treesitter.configs")
if not ts_status then
  vim.notify_once("nvim-treesitter não instalado. Execute :restart e depois :TSUpdate", vim.log.levels.WARN)
  return
end

treesitter("nvim-treesitter").setup({
  -- Lista de linguagens essenciais
  ensure_installed = {
    "lua", "vim", "vimdoc", "markdown", "markdown_inline", "bash"
  },

  indent = {
    enable = true,
  },

  highlight = {
    enable = true,
  },
})
