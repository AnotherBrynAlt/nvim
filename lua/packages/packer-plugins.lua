-- Bootstrap Packer https://github.com/wbthomason/packer.nvim#bootstrapping
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerSync
	augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

return require('packer').startup(function(use)
	-- Plugin Manager
	use 'wbthomason/packer.nvim' -- Packer can self manage
	use 'williamboman/mason.nvim' -- Package Manager for LSP, DAP, Linters, Formatters

	-- Lua Development
  	use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
	use "nvim-lua/popup.nvim" -- Downstream Popup API Test

	-- Language Server Protocol (LSP)
	use 'neovim/nvim-lspconfig' -- Enables Built-In LSP Client Via Configs
	use 'williamboman/mason-lspconfig.nvim' -- nvim-lspconfig bridge for mason.nvim
	use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
	use 'ray-x/lsp_signature.nvim' -- Show function signature when you type
	use 'simrat39/symbols-outline.nvim' -- A tree like view for symbols in Neovim using the Language Server Protocol. Supports all your favourite languages
	use 'https://git.sr.ht/~whynothugo/lsp_lines.nvim' -- lsp_lines is a simple neovim plugin that renders diagnostics using virtual lines on top of the real line of code

	-- Completions
	use 'hrsh7th/nvim-cmp' -- A completion engine plugin for neovim written in Lua. Completion sources are installed from external repositories and "sourced"
	use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in language server client
	use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words.
	use 'hrsh7th/cmp-path' -- nvim-cmp source for filesystem paths.
	use 'hrsh7th/cmp-cmdline' -- nvim-cmp source for vim's cmdline.
	use 'hrsh7th/cmp-nvim-lua' -- nvim-cmp source for neovim Lua API.

	-- GUI Modifications
	use 'lunarvim/darkplus.nvim'
	use 'wfxr/minimap.vim' -- Provides a simplistic minimap

	-- Treesitter
	use 'nvim-treesitter/nvim-treesitter'

	-- Bootstrap Packer At End Of Startup
	if packer_bootstrap then
		require('packer').sync()
	end
end)
