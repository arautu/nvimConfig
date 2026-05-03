-- keymaps.lua
--
-- Mapeamentos no modo normal (n)
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Mapeamentos no modo visual (v)

-- Mapeamentos no modo insert (i)

-- Mapeamentos no modo terminal (t)
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" }) -- Sair do modo terminal
