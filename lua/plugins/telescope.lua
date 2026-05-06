---@module 'telescope'
---
--- Configuração modular do telescope.nvim usando vim.pack
--- Documentação: :h telescope | https://github.com/nvim-telescope/telescope.nvim

-- ============================================================================
-- 1. Registro do plugin via vim.pack
-- ============================================================================
vim.pack.add({
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim" },
  { src = "https://github.com/nvim-telescope/telescope.nvim" },
})

-- ============================================================================
-- 2. Teclas de atalho 
-- ============================================================================
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find Files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Help Tags' })
vim.keymap.set('n', '<leader>fc', builtin.current_buffer_fuzzy_find, { desc = 'Find Current File' })

vim.keymap.set('n', '<leader>fn', function() builtin.find_files({ cwd = vim.fn.stdpath('config') }) end, {
  desc = 'Search Neovim files'
})
