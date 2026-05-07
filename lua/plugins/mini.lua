vim.pack.add({
  { src = 'https://github.com/nvim-tree/nvim-web-devicons' },
  { src = 'https://github.com/nvim-mini/mini.nvim' }
})

vim.cmd.colorscheme('miniwinter')

require('mini.surround').setup()
require('mini.statusline').setup()
require('mini.pairs').setup()
