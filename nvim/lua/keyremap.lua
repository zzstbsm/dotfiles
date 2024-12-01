vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Keymap section

vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)
vim.keymap.set('n', 'zz', vim.cmd.update, { desc = 'Update the current working file'})

vim.keymap.set('n', '<M-n>', vim.cmd.tabn, { desc = 'Open next tab' })
vim.keymap.set('n', '<M-p>', vim.cmd.tabp, { desc = 'Open previous tab' })
vim.keymap.set('n', '<M-t>', vim.cmd.tabnew, { desc = 'Open new tab' })
vim.keymap.set('n', '<M-w>', vim.cmd.tabclose, { desc = 'Close current open tab' })

