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
})
