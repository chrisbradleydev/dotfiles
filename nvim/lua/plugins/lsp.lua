return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			diagnostics = { virtual_text = { prefix = "icons" } },
			capabilities = {
				workspace = {
					didChangeWatchedFiles = {
						dynamicRegistration = false,
					},
				},
			},
			---@type lspconfig.options
			servers = {
				lua_ls = {
					-- cmd = { "/home/folke/projects/lua-language-server/bin/lua-language-server" },
					-- single_file_support = true,
					settings = {
						Lua = {
							misc = {
								-- parameters = { "--loglevel=trace" },
							},
							hover = { expandAlias = true },
							type = { castNumberToInteger = true },
							diagnostics = {
								disable = { "incomplete-signature-doc", "trailing-space" },
								-- enable = false,
								groupSeverity = {
									strong = "Warning",
									strict = "Warning",
								},
								groupFileStatus = {
									["ambiguity"] = "Opened",
									["await"] = "Opened",
									["codestyle"] = "None",
									["duplicate"] = "Opened",
									["global"] = "Opened",
									["luadoc"] = "Opened",
									["redefined"] = "Opened",
									["strict"] = "Opened",
									["strong"] = "Opened",
									["type-check"] = "Opened",
									["unbalanced"] = "Opened",
									["unused"] = "Opened",
								},
								unusedLocalExclude = { "_*" },
							},
						},
					},
				},
			},
		},
	},
}
