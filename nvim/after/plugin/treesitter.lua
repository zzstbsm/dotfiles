require('nvim-treesitter.configs').setup {
    ensure_installed = { 
		'cpp', 
		'lua', 
		'rust', 
		'toml',
		'vim', 
		'vimdoc', 
	},

    auto_install = true,

    highlight = { enable = true },

    indent = { enable = true },
	
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = nil,
	},
}
