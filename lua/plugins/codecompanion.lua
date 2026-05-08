---@module 'codecompanion'
---
--- Configuração modular do codecompanion usando vim.pack (Neovim 0.12+)
--- Documentação: :h codecompanion | https://codecompanion.olimorris.dev/installation

-- ============================================================================
-- 1. Registro do plugin via vim.pack
-- ============================================================================
vim.pack.add({
  { src = "https://www.github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
  {
    src = "https://www.github.com/olimorris/codecompanion.nvim",
    version = vim.version.range("^19.0.0")
  }
})

-- ============================================================================
-- 2. Adaptador ollama
-- ============================================================================
local api_key = os.getenv("OLLAMA_API_KEY")
local adapter = require("codecompanion.adapters").extend("ollama", {
  name = "ollama_cloud",
  env = {
    url = "https://ollama.com",
    api_key = api_key,
  },
  schema = {
    model = { default = "gpt-oss:120b-cloud" },
  },
  headers = {
    ["Authorization"] = function()
      return "Bearer " .. api_key
    end,
  },
})

-- ============================================================================
-- 3. Setup
-- ============================================================================
require("codecompanion").setup({
  strategies = {
    chat = { adapter = adapter },
    inline = { adapter = adapter },
  },
})
