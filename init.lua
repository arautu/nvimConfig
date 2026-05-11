-- ============================================================================
-- 1. Leader keys (teclas líder)
-- ============================================================================
-- Define a barra de espaço como tecla líder (<leader>) e líder local (<localleader>)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ============================================================================
-- 3. Aparência e UI
-- ============================================================================
vim.o.number = true         -- Exibe números de linha absolutos
vim.o.relativenumber = true -- Exibe números relativos (útil para movimentos como 5j)

vim.o.mouse = "a"           -- Habilita o mouse em todos os modos (útil para redimensionar splits)
vim.o.showmode = false       -- Não mostra o modo atual (-- INSERT --) pois o statusline já faz isso

vim.o.signcolumn = "yes" -- Mantém a coluna de sinais (para diagnósticos, git, etc.) sempre visível
vim.o.cursorline = true  -- Destaca a linha onde o cursor está
vim.o.scrolloff = 10     -- Mantém 10 linhas visíveis acima e abaixo do cursor (para conforto visual)

vim.o.list = true        -- Exibe caracteres invisíveis (veja listchars)
vim.opt.listchars = {    -- Define símbolos para espaços, tabs e NBSP
  tab = "» ",
  trail = "·",
  nbsp = "␣"
}

vim.g.ui2 = true -- Interface experimental na versão 0.12

-- ============================================================================
-- 5. Quebra de linha visual (wrap)
-- ============================================================================
vim.o.wrap = true -- Quebra de linha visual.

-- ============================================================================
-- 6. Comportamento de edição
-- ============================================================================
vim.o.tabstop = 2        -- Número de espaços que um <Tab> ocupa na tela
vim.o.shiftwidth = 2     -- Número de espaços usado para indentação automática (>>, <<, ==)
vim.o.expandtab = true   -- Converte tabs em espaços

vim.o.breakindent = true -- Mantém indentação em linhas quebradas automaticamente
vim.o.undofile = true    -- Salva histórico de undo em arquivo persistente (~/.local/state/nvim/undo/)

vim.o.updatetime = 250   -- Tempo (ms) para gravar swap file e disparar CursorHold (afeta LSP)
vim.o.timeoutlen = 1000  -- Tempo máximo (ms) de espera para sequências de teclas mapeadas

vim.o.splitright = true  -- Novas divisões verticais abrem à direita
vim.o.splitbelow = true  -- Novas divisões horizontais abrem abaixo

-- ============================================================================
-- 7. Busca e substituição
-- ============================================================================
vim.o.ignorecase = true    -- Busca case-insensitive por padrão
vim.o.smartcase = true     -- Ignora 'ignorecase' se o padrão contiver letras maiúsculas
vim.o.inccommand = "split" -- Mostra preview ao vivo para substituições (:%s/...)

-- ============================================================================
-- 8. Área de transferência (clipboard) – específico para WSL
-- ============================================================================
vim.o.clipboard = "unnamedplus" -- Usa o registro "+" para yank/paste (compartilha com sistema)
-- Configuração personalizada para usar clip.exe no WSL
vim.g.clipboard = {
  name = "WslClipboard",
  copy = {
    ["+"] = "clip.exe",
    ["*"] = "clip.exe",
  },
  paste = {
    ["+"] =
    'powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    ["*"] =
    'powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
  },
  cache_enabled = 0,
}

-- ============================================================================
-- 9. Destaca quando copiando textos
-- ============================================================================
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function() vim.hl.on_yank() end,
})

-- ============================================================================
-- 10. Mapeamento de teclas
-- ============================================================================
vim.keymap.set('n', '<leader>pu', vim.pack.update, { desc = 'Update Plugins' })

-- ============================================================================
-- 11. Flags e recursos opcionais
-- ============================================================================
vim.g.have_nerd_font = true -- Indica que o terminal tem uma Nerd Font instalada (útil para plugins)

require("keymaps")
require("plugins.treesitter")
require("plugins.mini")
require("plugins.nvim-lspconfig")
require("plugins.which-key")
require("plugins.telescope")
require("plugins.oil")
require("plugins.codecompanion")
