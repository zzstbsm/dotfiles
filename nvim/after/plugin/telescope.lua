local builtin = require('telescope.builtin')
local git_file_history = require("telescope").extensions.git_file_history

require('telescope').setup({
    extensions = {
        fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = true,  -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        },
        git_file_history = {
            mappings = {
                n = {
                    ['<C-g>'] = git_file_history.actions.open_in_browser,
                },
                i = {
                    ['<C-g>'] = git_file_history.actions.open_in_browser,
                },
                browser_command = nil,
            }
        }
    }
})

require('telescope').load_extension('fzf')
require('telescope').load_extension('git_file_history')

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find_files' })
vim.keymap.set('n', '<leader>fs', builtin.git_status, { desc = 'Telescope git_status' })
vim.keymap.set('n', '<leader>fc', builtin.git_commits, { desc = 'Telescope git_commits' })
vim.keymap.set('n', '<leader>fh', git_file_history.git_file_history, { desc = 'Telescope git_file_history' })
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end, { desc = "Telescope grep_string" })
