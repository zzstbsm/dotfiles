vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Keymap section

vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)
vim.keymap.set('n', 'zz', vim.cmd.update, { desc = 'Update the current working file'})

vim.keymap.set('n', '<M-n>', vim.cmd.tabn, { desc = 'Open next tab' })
vim.keymap.set('n', '<M-p>', vim.cmd.tabp, { desc = 'Open previous tab' })
vim.keymap.set('n', '<M-t>', vim.cmd.tabnew, { desc = 'Open new tab' })
vim.keymap.set('n', '<M-w>', vim.cmd.tabclose, { desc = 'Close current open tab' })

vim.keymap.set("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
vim.keymap.set("i", "<C-e>", "<End>", { desc = "move end of line" })
vim.keymap.set("i", "<C-h>", "<Left>", { desc = "move left" })
vim.keymap.set("i", "<C-l>", "<Right>", { desc = "move right" })
vim.keymap.set("i", "<C-j>", "<Down>", { desc = "move down" })
vim.keymap.set("i", "<C-k>", "<Up>", { desc = "move up" })

vim.keymap.set("n", "<C-s>", "<cmd>w<CR>", { desc = "general save file" })
vim.keymap.set("n", "<C-c>", "<cmd>%y+<CR>", { desc = "general copy whole file" })
