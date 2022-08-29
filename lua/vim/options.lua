-- Neovim 0.7.2 Options: https://neovim.io/doc/user/options.html
local options = {
	clipboard = 'unnamedplus',
	cmdheight = 1,
	conceallevel = 0,
	cursorline = true,
	expandtab = false,
	fileencoding = 'utf-8',
	laststatus = 3,
	mouse = 'a',
	number = true,
	numberwidth = 2,
	pumheight = 10,
	relativenumber = true,
	shiftwidth = 0,
	showmode = true,
	showtabline = 1,
	sidescrolloff = 8,
	smartcase = true,
	smartindent = true,
	softtabstop = 0,
	spell = true,
	splitbelow = true,
	splitright = true,
	swapfile = false,
	tabstop = 2,
	termguicolors = true,
	title = true,
	undofile = true,
	updatetime = 100,
	wrap = false,
	writebackup = false,
}

for key, value in pairs(options) do
  vim.opt[key] = value
end
