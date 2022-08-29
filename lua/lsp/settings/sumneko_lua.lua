return {
	settings = {
		Lua = {
			format = {
				enable = true,
			},
			diagnostics  = {
				globals = { 'vim', 'use' },
			},
			hint = {
				enable = true,
				arrayIndex = "Disable",
				await = true,
				paramName = "Disable",
				paramType = false,
				semicolon = "Disable",
				setType = true,
			},
			runtime = {
				version = 'LuaJIT',
				special = {
					reload = 'require',
				},
			},
			telemetry = {
				enable = false,
			},
			workspace = {
				library = {
					[vim.fn.expand '$VIMRUNTIME/lua'] = true,
					[vim.fn.stdpath 'config' .. '/lua'] = true,
				},
			},
		},
	},
}
