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
	-- {
	-- 	'nvim-tree/nvim-tree.lua',
	-- 	version = "*",
	-- 	dependencies = { 'nvim-tree/nvim-web-devicons' },
	-- 	config = function()
	-- 		require("nvim-tree").setup {}
	-- 	end,
	-- },

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

	-- Monochrom Colorscheme used by the ThePrimeagen
	-- {
	-- 	'kdheepak/monochrome.nvim',
	-- 	priority = 500,
	-- 	config = function()
	-- 		vim.cmd.colorscheme("monochrome")
	-- 	end
	-- },

	-- Gruvbox Colorscheme
	{
		'morhetz/gruvbox',
		priority = 500,
		config = function()
			vim.cmd.colorscheme("gruvbox")
		end
	},

	-- Save with sudo rights
	{
		'lambdalisue/suda.vim',
		config = function()
			vim.g["suda#prompt"] = string.format("[sudo] Mot de passe de %s: ", vim.env.USERNAME)
			vim.g["suda#nopass"] = 0
		end
	},

	-- Ranger integration
	{
		'kevinhwang91/rnvimr',
		config = function ()
			vim.g["rnvimr_enable_ex"] = 1
			vim.g["rnvimr_enable_picker"] = 1
			vim.g["rnvimr_draw_border"] = 1
			vim.keymap.set("n","<leader>f", function ()
				vim.cmd.RnvimrToggle()
			end)
		end
	},

	-- Emacs-like multiline cursors
	{ 'mg979/vim-visual-multi' },

	-- Common-Lisp Development Environment
	{
		'vlime/vlime',
		config = function ()
			vim.opt.rtp:append(vim.fn.stdpath("data") .. "/lazy/vlime/vim")
			vim.g["vlime_enable_autodoc"] = true
			-- vim.g["vlime_window_settings"] = {
			-- 	'sldb': {
			-- 		'pos': 'belowright',
			-- 		'vertical': true
			-- 	},
			-- 	'inspector': {
			-- 		'pos': 'belowright',
			-- 		'vertical': true
			-- 	},
			-- 	'preview': {
			-- 		'pos': 'belowright',
			-- 		'size': nil,
			-- 		'vertical': true
			-- 	}
			-- }
		end
	},

	-- Rust on steroids
	{
		'mrcjkb/rustaceanvim',
		version = '^4', -- Recommended
		lazy = false, -- This plugin is already lazy
	},
}
