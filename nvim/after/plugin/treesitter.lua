require('nvim-treesitter.configs').setup {
    build = 'TSUpdate',
    ensure_installed = {
        'bash',
        'c',
		'cpp',
        'css',
        'diff',
        'go',
        'html',
        'javascript',
        'json',
        'jsonc',
		'lua',
        'markdown',
        'python',
        'regex',
		'rust',
		'toml',
        'typescript',
		'vim',
		'vimdoc',
        'yaml',
	},

    auto_install = true,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = { 'ruby' }
    },

    indent = { enable = true, disable = { 'ruby' } },

	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = nil,
	},
}
