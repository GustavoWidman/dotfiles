return {
	{
		'Shatur/neovim-ayu',
		as = 'ayu',
		terminal = false,
		config = function()
			local colors = require('ayu.colors')
			colors.generate(false)

			require('ayu').setup({
				overrides = {
					LineNr = { fg = colors.comment },
					NonText = { fg = colors.comment },
					-- CursorLineConceal = { fg = colors.comment },
					-- NvimTreeIndentMarker = { fg = colors.comment },
				},
			})
		end,
	},
	{
		'LazyVim/LazyVim',
		opts = {
			colorscheme = 'ayu',
		},
	},
}
