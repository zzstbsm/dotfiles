vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Keymap section

vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)
vim.keymap.set('n', 'zz', vim.cmd.update, { desc = 'Update the current working file'})
