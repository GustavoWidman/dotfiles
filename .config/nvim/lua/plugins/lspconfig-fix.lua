-- return {}

return {
	'neovim/nvim-lspconfig',
	event = 'LazyFile',
	opts = function()
		local keys = require('lazyvim.plugins.lsp.keymaps').get()

		-- todo i gotta remap this key elsewhere
		keys[#keys + 1] = { 'K', false }
	end,
}
