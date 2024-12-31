-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Clipboard mappings
vim.keymap.set('v', '<C-S-c>', 'y', {
	desc = 'Copy to clipboard',
})
vim.keymap.set({ 'v', 'x', 'n' }, '<C-S-v>', 'p', {
	desc = 'Paste from clipboard',
})
vim.keymap.set('i', '<C-S-v>', '<C-r>+', {
	desc = 'Paste from clipboard',
})

-- Redo and undo
vim.keymap.set({ 'v', 'i', 'n', 'x' }, '<C-z>', '<cmd>undo<cr>', {
	desc = 'Undo',
})
vim.keymap.set({ 'v', 'i', 'n', 'x' }, '<C-y>', '<cmd>redo<cr>', {
	desc = 'Redo',
})

-- ctrl+X in insert mode deletes current line
vim.keymap.set('i', '<C-x>', '<C-o>dd', {
	desc = 'Delete current line',
})
-- ctrl+X in visual mode deletes all selected lines
vim.keymap.set('v', '<C-x>', 'dd', {
	desc = 'Delete all selected lines',
})
-- ctrl+X in normal mode deletes current line
vim.keymap.set('n', '<C-x>', 'dd', {
	desc = 'Delete current line',
})

-- tab and shift+tab in visual mode indent and unindent the selection
vim.keymap.set('v', '<Tab>', '>gv', {
	desc = 'Indent',
})
vim.keymap.set('v', '<S-Tab>', '<gv', {
	desc = 'Unindent',
})
-- tab and shift+tab in insert mode indent and unindent the selection
vim.keymap.set('i', '<Tab>', '<C-t>', {
	desc = 'Indent',
})
vim.keymap.set('i', '<S-Tab>', '<C-d>', {
	desc = 'Unindent',
})
-- tab and shift+tab in normal mode bla bla bla
vim.keymap.set('n', '<Tab>', '>>', {
	desc = 'Indent',
})
vim.keymap.set('n', '<S-Tab>', '<<', {
	desc = 'Unindent',
})

-- holding shift and moving the cursor in normal mode will move to visual mode and select
-- vim.keymap.set('n', '<S-k>', 'vk', {
-- 	desc = 'Move up and select',
-- 	noremap = true,
-- })
-- vim.keymap.set('n', '<S-j>', 'vj', {
-- 	desc = 'Move down and select',
-- 	noremap = true,
-- })
-- vim.keymap.set('n', '<S-Up>', 'vk', {
-- 	desc = 'Move up and select',
-- })
-- vim.keymap.set('n', '<S-Down>', 'vj', {
-- 	desc = 'Move down and select',
-- })

-- moving up and down in visual mode while holding shift is allowed
-- vim.keymap.set('v', '<S-j>', 'j', {
-- 	desc = 'Move down',
-- })
-- vim.keymap.set('v', '<S-k>', 'k', {
-- 	desc = 'Move up',
-- })
-- vim.keymap.set('v', '<S-Up>', 'k', {
-- 	desc = 'Move up',
-- })
-- vim.keymap.set('v', '<S-Down>', 'j', {
-- 	desc = 'Move down',
-- })

-- quick exit visual mode into insert mode
vim.keymap.set('v', 'i', '<esc>i', {
	desc = 'Exit visual mode',
})

-- bufferline settings
vim.keymap.set('n', '<M-1>', '<cmd>BufferLineGoToBuffer 1<cr>', {
	desc = 'Switch to buffer 1',
})
vim.keymap.set('n', '<M-2>', '<cmd>BufferLineGoToBuffer 2<cr>', {
	desc = 'Switch to buffer 2',
})
vim.keymap.set('n', '<M-3>', '<cmd>BufferLineGoToBuffer 3<cr>', {
	desc = 'Switch to buffer 3',
})
vim.keymap.set('n', '<M-4>', '<cmd>BufferLineGoToBuffer 4<cr>', {
	desc = 'Switch to buffer 4',
})
vim.keymap.set('n', '<M-5>', '<cmd>BufferLineGoToBuffer 5<cr>', {
	desc = 'Switch to buffer 5',
})
vim.keymap.set('n', '<M-6>', '<cmd>BufferLineGoToBuffer 6<cr>', {
	desc = 'Switch to buffer 6',
})
vim.keymap.set('n', '<M-7>', '<cmd>BufferLineGoToBuffer 7<cr>', {
	desc = 'Switch to buffer 7',
})
vim.keymap.set('n', '<M-8>', '<cmd>BufferLineGoToBuffer 8<cr>', {
	desc = 'Switch to buffer 8',
})
vim.keymap.set('n', '<M-9>', '<cmd>BufferLineGoToBuffer 9<cr>', {
	desc = 'Switch to buffer 9',
})
vim.keymap.set('n', '<M-0>', '<cmd>BufferLineGoToBuffer 10<cr>', {
	desc = 'Switch to buffer 10',
})

vim.keymap.set('n', '<M-w>', '<cmd>lua require("bufdelete").bufdelete(0)<cr>', {
	desc = 'Close current buffer',
})

-- nvim-tree focus
vim.keymap.set('n', '<M-q>', '<cmd>Neotree<cr>', {
	desc = 'Focus on nvim-tree',
})

-- lsp show map to Shift-k
vim.keymap.set('n', '<S- >', vim.lsp.buf.hover, {
	desc = 'Show hover',
	silent = true,
	noremap = true,
})
