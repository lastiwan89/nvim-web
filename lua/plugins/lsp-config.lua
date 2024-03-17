return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		inlay_hints = { enabled = false },
		-- @type lspconfig.options
		servers = {
			cssls = {
				settings = {
					css = {
						lint = { unknownAtRules = "ignore" },
					},
				},
			},
			tailwindcss = {
				root_dir = function(...)
					return require("lspconfig.util").root_pattern(".git")(...)
				end,
			},
			tsserver = {
				root_dir = function(...)
					return require("lspconfig.util").root_pattern(".git")(...)
				end,
				single_file_support = false,
				settings = {
					typescript = {
						inlayHints = {
							includeInlayParameterNameHints = "literal",
							includeInlayParameterNameHintsWhenArgumentMatchesName = false,
							includeInlayFunctionParameterTypeHints = true,
							includeInlayVariableTypeHints = false,
							includeInlayPropertyDeclarationTypeHints = true,
							includeInlayFunctionLikeReturnTypeHints = true,
							includeInlayEnumMemberValueHints = true,
						},
					},
					javascript = {
						inlayHints = {
							includeInlayParameterNameHints = "all",
							includeInlayParameterNameHintsWhenArgumentMatchesName = false,
							includeInlayFunctionParameterTypeHints = true,
							includeInlayVariableTypeHints = true,
							includeInlayPropertyDeclarationTypeHints = true,
							includeInlayFunctionLikeReturnTypeHints = true,
							includeInlayEnumMemberValueHints = true,
						},
					},
				},
			},
			gopls = {
				root_dir = function(...)
					return require("lspconfig.util").root_pattern(".git")(...)
				end,
				settings = {
					gopls = {
						analyses = {
							unusedparams = true,
						},
						staticcheck = true,
						gofumpt = true,
					},
				},
			},
			html = {},
			yamlls = {
				settings = {
					yaml = {
						keyOrdering = false,
					},
				},
			},
			lua_ls = {
				-- enabled = false,
				single_file_support = true,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
							hint = {
								enable = false,
							},
						},
						runtime = {
							-- Tell the language server which version of Lua you're using
							-- (most likely LuaJIT in the case of Neovim)
							version = "LuaJIT",
						},
						-- Make the server aware of Neovim runtime files
						workspace = {
							checkThirdParty = false,
							library = {
								vim.env.VIMRUNTIME,
								-- "${3rd}/luv/library"
								-- "${3rd}/busted/library",
							},
							-- or pull in all of 'runtimepath'. NOTE: this is a lot slower
							-- library = vim.api.nvim_get_runtime_file("", true)
						},
					},
					-- Lua = {
					-- 	runtime = {
					-- 		version = "LuaJIT",
					-- 		pathStrict = true,
					-- 		path = { "?.lua", "?/init.lua" },
					-- 	},
					-- 	workspace = {
					-- 		checkThirdParty = false,
					-- 	},
					-- 	completion = {
					-- 		workspaceWord = true,
					-- 		callSnippet = "Both",
					-- 	},
					-- 	misc = {
					-- 		parameters = {
					-- 			-- "--log-level=trace",
					-- 		},
					-- 	},
					-- 	hint = {
					-- 		enable = true,
					-- 		setType = false,
					-- 		paramType = true,
					-- 		paramName = "Disable",
					-- 		semicolon = "Disable",
					-- 		arrayIndex = "Disable",
					-- 	},
					-- 	doc = {
					-- 		privateName = { "^_" },
					-- 	},
					-- 	type = {
					-- 		castNumberToInteger = true,
					-- 	},
					-- 	diagnostics = {
					-- 		globals = { "vim" },
					-- 		disable = { "incomplete-signature-doc", "trailing-space" },
					-- 		-- enable = false,
					-- 		groupSeverity = {
					-- 			strong = "Warning",
					-- 			strict = "Warning",
					-- 		},
					-- 		groupFileStatus = {
					-- 			["ambiguity"] = "Opened",
					-- 			["await"] = "Opened",
					-- 			["codestyle"] = "None",
					-- 			["duplicate"] = "Opened",
					-- 			["global"] = "Opened",
					-- 			["luadoc"] = "Opened",
					-- 			["redefined"] = "Opened",
					-- 			["strict"] = "Opened",
					-- 			["strong"] = "Opened",
					-- 			["type-check"] = "Opened",
					-- 			["unbalanced"] = "Opened",
					-- 			["unused"] = "Opened",
					-- 		},
					-- 		unusedLocalExclude = { "_*" },
					-- 	},
					-- 	format = {
					-- 		enable = false,
					-- 		defaultConfig = {
					-- 			indent_style = "space",
					-- 			indent_size = "2",
					-- 			continuation_indent_size = "2",
					-- 		},
					-- 	},
					-- },
				},
			},
		},
		setup = {},
	},
}
