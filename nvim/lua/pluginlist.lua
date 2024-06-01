return {

    -- Theme plugin
    {
        "folke/tokyonight.nvim",
        priority = 1000,
		config = function()
			vim.cmd("colorscheme tokyonight-storm")
		end
    },
    
	-- Icons plugin
	{
        'nvim-lualine/lualine.nvim',
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        config = function()
            require("lualine").setup(
	    		{
                    icons_enabled = true,
                    theme = 'tokoynight',
                }
			)
        end,
    },


	-- LSP plugin configuration
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",

    -- Neovim namespace for code completion in the setup
	"folke/neodev.nvim",
	"simrat39/rust-tools.nvim",

	-- Code completion
    {
        'hrsh7th/nvim-cmp',						-- Nvim completion framework
        dependencies = {
            'L3MON4D3/LuaSnip',                	-- Code snippet support
            'saadparwaiz1/cmp_luasnip',        	-- Snippet for configuration part
            'rafamadriz/friendly-snippets',    	-- Snippet support for a variety of programming languages
			
			'hrsh7th/cmp-nvim-lua',
			'hrsh7th/cmp-nvim-lsp-signature-help',
			'hrsh7th/cmp-vsnip',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-buffer',
			'hrsh7th/vim-vsnip',

            'hrsh7th/cmp-nvim-lsp',				-- Nvim completion source
		},
	},
	
	-- Debugger
	"puremourning/vimspector",

	-- Telescope plugin
    { 
		'nvim-telescope/telescope.nvim',
		tag = '0.1.6',
		branch = '0.1.x',
		dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
		'nvim-telescope/telescope-fzf-native.nvim',
		build = 'make',
    },
   
	-- Treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
    },

}
