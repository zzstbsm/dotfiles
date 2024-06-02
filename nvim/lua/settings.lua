--vim.g.mapleader = ' '
--vim.g.maplocalleader = ' '
--
---- Keymap section
--require('lua.keyremap')

-- Settings
vim.o.clipboard = 'unnamedplus'

vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = 'yes'

vim.o.tabstop = 4
vim.o.shiftwidth = 4

vim.o.updatetime = 300

vim.o.termguicolors = true

vim.o.mouse = 'a'

--require("vimspector_opt")

--Set completeopt to have a better completion experience
-- :help completeopt
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not select, force to select one from the menu
-- shortness: avoid showing extra messages when using completion
-- updatetime: set updatetime for CursorHold
vim.opt.completeopt = {'menuone', 'noselect', 'noinsert'}
vim.opt.shortmess = vim.opt.shortmess + { c = true}
vim.api.nvim_set_option('updatetime', 300) 

-- Fixed column for diagnostics to appear
-- Show autodiagnostic popup on cursor hover_range
-- Goto previous / next diagnostic warning / error 
-- Show inlay_hints more frequently 
vim.cmd([[
	set signcolumn=yes
	autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])


