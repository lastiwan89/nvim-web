return {
    "danymat/neogen",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "L3MON4D3/LuaSnip",
    },

    config = function()
        require("neogen").setup({
            snippet_engine = "luasnip"
        })

        vim.keymap.set("n", "<leader>nf", ":lua require('neogen').generate({ type =  'func' })<CR>")
        vim.keymap.set("n", "<leader>nt", ":lua require('neogen').generate({ type =  'type' })<CR>")
        vim.keymap.set("n", "<leader>nc", ":lua require('neogen').generate({ type =  'class' })<CR>")
        vim.keymap.set("n", "<leader>nd", ":lua require('neogen').generate({ type =  'typedef' })<CR>")
    end,
}
