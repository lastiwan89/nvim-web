-- Go related

-- Run gofmt + goimport on save

local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.go",
	callback = function()
		require("go.format").goimport()
	end,
	group = format_sync_grp,
})

vim.api.nvim_create_autocmd("filetype", {
	-- group = augroup("wrap_spell"),
	pattern = { "go" },
	command = 'lua require("cmp").setup { enabled = true }',
})
