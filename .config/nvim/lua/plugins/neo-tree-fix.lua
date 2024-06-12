return {
	'nvim-neo-tree/neo-tree.nvim',
	opts = function(_, opts)
		opts.window.width = 30
		opts.filesystem.filtered_items = { visible = true }
	end,
}
