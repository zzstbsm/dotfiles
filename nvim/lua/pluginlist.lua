return {

    -- Theme plugin
    {
        "folke/tokyonight.nvim",
        priority = 1000,
		config = function()
			vim.cmd("colorscheme tokyonight-storm")
		end
    },


	-- LSP plugin configuration
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",

    -- Neovim namespace for code completion in the setup
	"folke/neodev.nvim",

	-- Code completion
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'L3MON4D3/LuaSnip',                -- Code snippet support
            'saadparwaiz1/cmp_luasnip',        -- Snippet for configuration part
            'rafamadriz/friendly-snippets',    -- Snippet support for a variety of programming languages
            
            'hrsh7th/cmp-nvim-lsp', 
            
        },
    },

	-- Telescope plugin
    { 
        'nvim-telescope/telescope.nvim',
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
    }

}
