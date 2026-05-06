---@module 'keymaps'

-- ============================================================================
-- 1. Mapeamentos no modo normal (n)
-- ============================================================================
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- ============================================================================
-- 2. Mapeamentos no modo visual (v)
-- ============================================================================

-- ============================================================================
-- 3. Mapeamentos no modo insert (i)
-- ============================================================================

-- ============================================================================
-- 4. Mapeamentos no modo terminal (t)
-- ============================================================================
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" }) -- Sair do modo terminal
