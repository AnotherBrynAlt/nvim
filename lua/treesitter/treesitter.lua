require('nvim-treesitter.configs').setup({
	ensure_installed = { 'lua', 'rust' },
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	}
})
