local mason_status_ok, mason = pcall(require, "mason")
if not mason_status_ok then
  return
end

local mason_lspconfig_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status_ok then
  return
end

local servers = {
	'sumneko_lua',
	'elmls'
}

mason.setup({
	ui = {
		border = "rounded",
		check_outdated_packages_on_open = true,
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
        },
        keymaps = {
			-- Keymap to expand a package
			toggle_package_expand = "<CR>",
			-- Keymap to install the package under the current cursor position
			install_package = "i",
			-- Keymap to reinstall/update the package under the current cursor position
			update_package = "u",
			-- Keymap to check for new version for the package under the current cursor position
			check_package_version = "c",
			-- Keymap to update all installed packages
			update_all_packages = "U",
			-- Keymap to check which installed packages are outdated
			check_outdated_packages = "C",
			-- Keymap to uninstall a package
			uninstall_package = "X",
			-- Keymap to cancel a package installation
			cancel_installation = "<C-c>",
			-- Keymap to apply language filter
            apply_language_filter = "<C-f>",
        },
	},
--	install_root_dir = path.concat { vim.fn.stdpath "data", "mason" },
	pip = {
		install_args = {},
	},
	log_level = vim.log.levels.INFO,
	max_concurent_installers = 8,
	github = {
		download_url_template = "https://github.com/%s/releases/download/%s/%s",
	},
})

mason_lspconfig.setup({
	ensure_installed = servers,
	automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_status_ok then
	return
end

for _, value in pairs(servers) do
	local options = {
		on_attach = require('lsp.handlers').on_attach,
		capabilities = require('lsp.handlers').capabilities,
	}

	local server = vim.split(value, "@")[1]

	if server == 'sumneko_lua' then
		local lua_dev_status_ok, lua_dev = pcall(require, 'lua-dev')
		if not lua_dev_status_ok then
			local sumneko_options = require('lsp.settings.sumneko_lua')
			options = vim.tbl_deep_extend('force', sumneko_options, options)
			lspconfig.sumneko_lua.setup(options)
			goto continue
		end
		local luadev = lua_dev.setup({
			lspconfig = {
				on_attach = options.on_attach,
				capabilities = options.capabilities
			},
		})
		lspconfig.sumneko_lua.setup(luadev)
		goto continue
	end

	if server == 'elmls' then
		local elmls_options = require('lsp.settings.elmls')
		options = vim.tbl_deep_extend('force', elmls_options, options)
		lspconfig.elmls.setup(options)
		goto continue
	end

	lspconfig[server].setup(options)
	::continue::
end
