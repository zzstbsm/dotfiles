vim.keymap.set('n', '<leader>gs', vim.cmd.Git, { desc = 'Show git status' } )
vim.keymap.set('n', '<leader>gd', ':Gvdiffsplit!<CR>', { desc = 'Git diff merge tool' } )

-- Enable merge conflict options only when in diffmode
vim.api.nvim_create_autocmd("BufEnter", {
    callback = function(_)
        if vim.wo.diff then
            vim.keymap.set('n', '<leader>gml', ':diffget //2<CR>', { desc = 'Merge conflict select left' } )
            vim.keymap.set('n', '<leader>gmr', ':diffget //3<CR>', { desc = 'Merge conflict select right' } )
        end
    end
})
vim.keymap.set('n', '<leader>gl', ':G log<CR>', { desc = 'Git log' } )
vim.keymap.set('n', '<leader>gc', ':G commit<CR>', { desc = 'Git commit' } )
vim.keymap.set('n', '<leader>gp', ':G push<CR>', { desc = 'Git push' } )

