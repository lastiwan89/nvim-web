return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	opts = {
		menu = {
			width = vim.api.nvim_win_get_width(0) - 4,
		},
	},
	keys = {
		{
			"<leader>hm",
			function()
				require("harpoon"):list():append()
			end,
			desc = "Harpoon file Mark",
		},
		{
			"<leader>hh",
			function()
				local harpoon = require("harpoon")
				require("harpoon").ui:toggle_quick_menu(harpoon:list())
			end,
			desc = "Harpoon quick menu",
		},
		{
			"<leader>1",
			function()
				require("harpoon"):list():select(1)
			end,
			desc = "Harpoon to file 1",
		},
		{
			"<leader>2",
			function()
				require("harpoon"):list():select(2)
			end,
			desc = "Harpoon to file 2",
		},
		{
			"<leader>3",
			function()
				require("harpoon"):list():select(3)
			end,
			desc = "Harpoon to file 3",
		},
		{
			"<leader>4",
			function()
				require("harpoon"):list():select(4)
			end,
			desc = "Harpoon to file 4",
		},
		{
			"<leader>5",
			function()
				require("harpoon"):list():select(5)
			end,
			desc = "Harpoon to file 5",
		},
		-- Toggle previous & next buffers stored within Harpoon list
		{
			"<C-S-P>",
			function()
				require("harpoon"):list():prev()
			end,
		},
		{
			"<C-S-O>",
			function()
				require("harpoon"):list():next()
			end,
		},
	},
}