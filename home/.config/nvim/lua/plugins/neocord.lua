return {
	'IogaMaster/neocord',
	event = 'VeryLazy',
	config = function()
		require('neocord').setup({
			global_timer = true,
			logo = 'https://codeium.com/static/images/ides/neovim_logo.png',
			logo_tooltip = 'Neovim',
			-- main_image = 'logo',
		})
	end,
}
