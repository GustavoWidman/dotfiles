return {
	'hrsh7th/nvim-cmp',
	event = 'InsertEnter',
	--@params opts cmp.ConfigSchema
	opts = function(_, opts)
		local cmp = require('cmp')

		opts.mapping = vim.tbl_extend('force', opts.mapping, {
			['<Tab>'] = LazyVim.cmp.confirm(),
			['<C-j>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
			['<C-k>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
			['<C-c>'] = cmp.mapping.abort(),
		})

		-- opts.completion = vim.tbl_extend('force', opts.completion, {
		-- 	autocomplete = false,
		-- })
	end,
}
