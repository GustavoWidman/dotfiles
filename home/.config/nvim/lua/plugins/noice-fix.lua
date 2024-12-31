return {
	'folke/noice.nvim',
	opts = function(_, opts)
		opts.lsp.hover = { silent = true }
	end,
}
