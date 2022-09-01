local treesitter_status_ok, treesitter_configs = pcall(require, 'nvim-treesitter.configs')
if not treesitter_status_ok then
	return
end

treesitter_configs.setup({
	-- ensure_installed = grammars,
	ensure_installed = { 'lua', 'rust' },
	sync_install = true,
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
})
