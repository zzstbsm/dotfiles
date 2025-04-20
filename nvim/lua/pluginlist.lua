return {

    -- Theme plugin
    {
        "folke/tokyonight.nvim",
        priority = 1000,
		config = function()
			vim.cmd("colorscheme tokyonight-storm")
		end
    },
	-- Tree view
    {
    	'nvim-tree/nvim-tree.lua',
    	version = '*',
    	lazy = false,
    	dependencies = {
    		"nvim-tree/nvim-web-devicons",
    	},
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
    -- Set bar for code context
    {
        "utilyre/barbecue.nvim",
        name = "barbecue",
        version = "*",
        dependencies = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons", -- optional dependency
        },
    },
    -- Add scrollbar
    {
        "petertriho/nvim-scrollbar",
        dependencies = {
            "lewis6991/gitsigns.nvim",      -- git signs on the scrollbar
            "kevinhwang91/nvim-hlslens",
        }
    },
    -- Fold/unfold code
    {
        "kevinhwang91/nvim-ufo",
        dependencies = {
            "kevinhwang91/promise-async"
        }
    },

	-- LSP plugin configuration
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",

    -- Debugger Adapter Protocol
    "mfussenegger/nvim-dap",
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio"
        }
    },

    -- Linter
    "mfussenegger/nvim-lint",

    -- Formatter
    "mhartington/formatter.nvim",

    -- Neovim namespace for code completion in the setup
	"folke/neodev.nvim",
	"simrat39/rust-tools.nvim",

	-- Code completion
    {
		-- Nvim completion framework
        'hrsh7th/nvim-cmp',
        dependencies = {
            {
                -- Code snippet support
                'L3MON4D3/LuaSnip',
	            run = "make install_jsregexp",
                dependencies = {
                    -- Snippet support for a variety of programming languages
                    'rafamadriz/friendly-snippets',

                    'nvim-treesitter/nvim-treesitter',
                }
            },
            -- Snippet for configuration part
            'saadparwaiz1/cmp_luasnip',

			'hrsh7th/cmp-nvim-lua',
			'hrsh7th/cmp-nvim-lsp-signature-help',
			'hrsh7th/cmp-vsnip',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-buffer',
			'hrsh7th/vim-vsnip',
            -- Nvim completion source
            'hrsh7th/cmp-nvim-lsp',
		},
	},

    -- Auto close tag for frontend dev
    "windwp/nvim-ts-autotag",

    -- Commenter
    {
        'numToStr/Comment.nvim',
        lazy = false,
    },

    -- Indentation lines
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
    },

	-- Debugger
	"puremourning/vimspector",

	-- Telescope plugin
    {
		'nvim-telescope/telescope.nvim',
		tag = '0.1.6',
		branch = '0.1.x',
		dependencies = {
            {
                "isak102/telescope-git-file-history.nvim",
                dependencies = {
                    "tpope/vim-fugitive"
                }
            },
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make',
            },
            "nvim-lua/plenary.nvim",
        }
    },

	-- Treesitter: Highlighting
    'nvim-treesitter/nvim-treesitter',
	'nvim-treesitter/playground',

    -- Harpoon
	'theprimeagen/harpoon',

	-- UndoTree
	'mbbill/undotree',

	-- Git tool
	'tpope/vim-fugitive',
    {
        'rhysd/git-messenger.vim',
        init = function()
            vim.g.git_messenger_no_default_mappings = true
        end
    },
    'f-person/git-blame.nvim',
    'lewis6991/gitsigns.nvim',
    'sindrets/diffview.nvim',

    -- Floating terminal
    'voldikss/vim-floaterm',
    {
        "SmiteshP/nvim-navbuddy",
        dependencies = {
            "neovim/nvim-lspconfig",
            "SmiteshP/nvim-navic",
            "MunifTanjim/nui.nvim",
            "numToStr/Comment.nvim",        -- Optional
            "nvim-telescope/telescope.nvim" -- Optional
        }
    },

    -- Surround strings with markers
    'tpope/vim-surround',

    -- Autoclose brackets
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
    },

    -- Vimwiki
    {
        'vimwiki/vimwiki',
        tag = 'v2024.01.24',
        init = function()
            vim.g.vimwiki_list = {
                { path = "$HOME/Nextcloud/Notes/", syntax = 'markdown', ext = '.md' }
            }
            vim.g.vimwiki_use_mouse = 1
        end
    },

    -- Markdown preview
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },

    -- Live server for frontend developement
    {
        "aurum77/live-server.nvim",
        cmd = {
            "LiverServer", "LiverServerStart", "LiveServerStop"
        },
        config = function()
            require("live_server.util").install()
        end,
    },
    -- 
    {
        "roobert/tailwindcss-colorizer-cmp.nvim",
        config = function()
            require("tailwindcss-colorizer-cmp").setup({
                color_square_width = 2,
            })
        end
    },
    -- Prettier for js
    'prettier/vim-prettier',

    -- VimBeGood Game
    'ThePrimeagen/vim-be-good'

}
