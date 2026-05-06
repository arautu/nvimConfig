vim.pack.add({
  "https://github.com/folke/which-key.nvim",
})

local wk = require("which-key")

wk.setup({
    preset = "modern", -- Opções: "classic", "modern", "helix"
    win = {
        border = "rounded", -- Borda elegante para NerdFonts
    },
    icons = {
        breadcrumb = "»",
        separator = "➜",
        group = "+",
        -- Se estiver usando NerdFont v3.x
        mappings = true,
        rules = {},
        colors = true,
    },
})

wk.add({
  { "<leader>f", group = "file" }, -- group
  { "<leader>w", proxy = "<c-w>", group = "windows" }, -- proxy to window mappings
  {
    mode = { "n", "v" }, -- NORMAL and VISUAL mode
    { "<leader>q", "<cmd>q<cr>", desc = "Quit" }, -- no need to specify mode since it's inherited
    { "<leader>w", "<cmd>w<cr>", desc = "Write" },
  }
})
