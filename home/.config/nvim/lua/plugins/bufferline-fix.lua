return {
	'akinsho/bufferline.nvim',
	event = 'VeryLazy',
	opts = function(_, opts)
		opts.options.always_show_bufferline = true
		opts.options.indicator = {
			icon = nil,
			style = 'none',
		}
		opts.options.offsets = {
			{
				filetype = 'neo-tree',
				text = 'File Explorer',
				highlight = 'Directory',
				text_align = 'left',
			},
		}
	end,
}
