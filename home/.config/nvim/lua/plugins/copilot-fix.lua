return {
	{
		'zbirenbaum/copilot.lua',
		config = function()
			require('copilot').setup({
				suggestion = {
					enabled = true,
					auto_trigger = true,
					keymap = {
						next = '<M-\\>',
						dismiss = '<C-c>',
					},
				},
				filetypes = {
					markdown = true,
					help = true,
				},
			})

			-- smart copilot completions on tab
			-- (if copilot completion is visible, tab is used to select the completion)
			local copilot = require('copilot.suggestion')
			local keys = vim.api.nvim_replace_termcodes('<Tab>', true, false, true)
			local function copilot_tab()
				if copilot.is_visible() then
					copilot.accept()
				else
					vim.api.nvim_feedkeys(keys, 'n', true)
				end
			end

			vim.keymap.set('i', '<Tab>', copilot_tab, {
				desc = 'Copilot tab',
				noremap = true,
			})
		end,
	},
	-- {
	-- 	'nvim-cmp',
	-- 	opts = function(_, opts)
	-- 		table.remove(opts, 1)
	-- 	end,
	-- },
}
