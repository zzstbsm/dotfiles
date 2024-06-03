require('nvim-treesitter.configs').setup {
    ensure_installed = {
        'bash',
        'c',
		'cpp',
        'diff',
        'html',
        'json',
        'jsonc',
		'lua',
        'markdown',
        'python',
        'regex',
		'rust',
		'toml',
		'vim',
		'vimdoc',
        'yaml',
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
