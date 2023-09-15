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
}
