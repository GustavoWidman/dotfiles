-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- indentation fixes
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.autoindent = true
vim.o.smartindent = true

-- line numbers and dsiable relative numbers
vim.o.number = true
-- vim.o.relativenumber = false

-- make it so that cursor is always I-Beam and goes until after the last character
vim.o.guicursor = 'n-v-c-i:ver25'

-- fix some case sensitivity issues
vim.o.ignorecase = true
vim.o.smartcase = true

-- make neovide thing be less over the top
vim.g.neovide_cursor_trail_size = 0

vim.opt.wrap = true
