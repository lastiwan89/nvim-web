return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.5",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-fzf-native.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    telescope.setup({
      defaults = {
        mappings = {
          i = {
            ["<esc>"] = actions.close,
          },
        },
      },
    })

    vim.keymap.set("n", "<leader>ff", telescope.builtin.find_files, {})
    vim.keymap.set("n", "<leader>fg", telescope.builtin.live_grep, {})
    vim.keymap.set("n", "<leader>fb", telescope.builtin.buffers, {})
    vim.keymap.set("n", "<leader>fh", telescope.builtin.help_tags, {})
  end,
}
