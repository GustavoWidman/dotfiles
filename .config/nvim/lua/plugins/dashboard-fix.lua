return {
	'nvimdev/dashboard-nvim',
	lazy = false,
	opts = function(_, opts)
		local logo = [[
LOGO
            ]]

		logo = string.rep('\n', 8) .. logo .. '\n\n'
		opts.config.header = vim.split(logo, '\n')
		opts.theme = 'doom'
	end,
}
