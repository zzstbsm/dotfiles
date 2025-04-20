function SetColorScheme(color)

	-- color = color or 'tokyonight-storm'
	color = color or 'nordic'
	-- color = color or 'everforest'


    -- vim.g.everforest_background = 'soft'
    -- vim.g.everforest_background = 'medium'
    -- vim.g.everforest_background = 'hard'
    vim.g.everforest_better_performance = 1
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end

SetColorScheme()
