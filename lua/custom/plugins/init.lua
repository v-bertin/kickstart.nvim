-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
	-- vim plugin for bitbak'ing Yocto recipes
	{ 'kergoth/vim-bitbake' },

	-- Markdown preview
	{
		'iamcco/markdown-preview.nvim',
		ft = "markdown",
		config = function()
			vim.fn["mkdp#util#install"]()
		end,
	},

	-- File viewer in VS code style
	{
		'nvim-tree/nvim-tree.lua',
		version = "*",
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function()
			require("nvim-tree").setup {}
		end,
	},

	-- Flutter support in neovim
	{
		'akinsho/flutter-tools.nvim',
		lazy = false,
		dependencies = {
			'nvim-lua/plenary.nvim',
			'stevearc/dressing.nvim', -- optional for vim.ui.select
		},
		config = true,
	},

	-- Linter for Bitbake
	{
		"mfussenegger/nvim-lint",
		config = function ()
			require('lint').linters_by_ft = {
				bitbake = {'oelint-adv', },
			}
			vim.api.nvim_create_autocmd({ "BufWritePost" }, {
				callback = function()
					require("lint").try_lint()
				end,
			})
		end
	},

	-- Project wide search and replace
	{
		"nvim-pack/nvim-spectre",
		dependencies = {
			'nvim-lua/plenary.nvim',
			'nvim-tree/nvim-web-devicons',
		},
	},
}
