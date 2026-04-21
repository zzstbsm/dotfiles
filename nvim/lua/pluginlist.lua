return {

    -- Theme plugin
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
    },
    {
        'AlexvZyl/nordic.nvim',
        lazy = false,
        priority = 1000,
    },
    {
        'sainnhe/everforest',
        lazy = false,
        priority = 1000,
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000
    },
    -- Nerdicons integration inside nvim
    {
        'glepnir/nerdicons.nvim',
        cmd = 'NerdIcons',
        config = function()
            require('nerdicons').setup({})
        end
    },
    -- Alpha nvim welcome dashboard
    {
        'goolord/alpha-nvim',
        dependencies = {
        },
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
        lazy = true,
        event = "VeryLazy",
        config = function()
            require("lualine").setup(
                {
                    icons_enabled = true,
                }
            )
        end,
    },
    -- Improve tab aestethics
    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = {
            "nvim-tree/nvim-web-devicons", -- optional dependency
        },
        lazy = true,
        event = "VeryLazy",
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
        lazy = true,
        event = "VeryLazy",
    },
    -- Add scrollbar
    {
        "petertriho/nvim-scrollbar",
        dependencies = {
            "lewis6991/gitsigns.nvim",      -- git signs on the scrollbar
            "kevinhwang91/nvim-hlslens",
        }
        ,
        lazy = true,
        event = "VeryLazy",
    },
    -- Fold/unfold code
    {
        "kevinhwang91/nvim-ufo",
        dependencies = {
            "kevinhwang91/promise-async"
        }
        ,
        lazy = true,
        event = "BufReadPost",
    },
    -- -- Dimming inactive code
    -- {
    --     "folke/twilight.nvim",
    --     config = function ()
    --         vim.cmd(":TwilightEnable")
    --     end
    -- },

    -- Pretty notifications
    {
        "rcarriga/nvim-notify",
        lazy = true,
        event = "VeryLazy",
    },

    -- LSP plugin configuration
    {
        "williamboman/mason.nvim",
        lazy = true,
        cmd = "Mason",
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = true,
    },
    {
        "neovim/nvim-lspconfig",
        lazy = true,
        event = "LspAttach",
    },

    -- Debugger Adapter Protocol
    {
        "mfussenegger/nvim-dap",
        lazy = true,
        cmd = {
            "Dap",
            "DapContinue",
            "DapToggleBreakpoint",
        },
    },
    {
        "rcarriga/nvim-dap-ui",
        lazy = true,
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio",
        }
    },

    -- Linter
    {
        "mfussenegger/nvim-lint",
        lazy = true,
        event = "BufWritePre",
    },

    -- Formatter
    {
        "mhartington/formatter.nvim",
        lazy = true,
        event = "BufWritePre",
    },

    -- Neovim namespace for code completion in the setup
    {
        "folke/neodev.nvim",
        lazy = true,
        ft = "lua",
    },
	-- "simrat39/rust-tools.nvim",
    {
        'mrcjkb/rustaceanvim',
        version = '^6', -- Recommended
        lazy = false, -- This plugin is already lazy
    },

	-- Code completion
    {
		-- Nvim completion framework
        'hrsh7th/nvim-cmp',
        lazy = true,
        event = "InsertEnter",
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
    {
        "windwp/nvim-ts-autotag",
        lazy = true,
        event = "InsertEnter"
    },

    -- Commenter
    {
        'numToStr/Comment.nvim',
        lazy = true,
        keys = { "gc", "gcc" },
    },

    -- Indentation lines
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        lazy = true,
        event = "BufReadPost",
    },

    -- Search hlslens
    {
        "kevinhwang91/nvim-hlslens",
        lazy = true, event =
        "BufReadPost"
    },

    -- Debugger
    {
        "puremourning/vimspector",
        lazy = true,
        cmd = "VimspectorToggle"
    },

	-- Telescope plugin
    {
		'nvim-telescope/telescope.nvim',
		tag = 'v0.2.2',
		branch = 'master',
 		lazy = true,
 		cmd = "Telescope",
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
    {
        'nvim-treesitter/nvim-treesitter',
        lazy = false,
        branch = 'main',
        build = ':TSUpdate'
    },
	-- 'nvim-treesitter/playground',

    -- Harpoon
    {
        'theprimeagen/harpoon',
        lazy = true,
        event = "BufReadPost",
    },

    -- UndoTree
    {
        'mbbill/undotree',
        lazy = true,
        cmd = "UndotreeToggle",
    },

    -- Git tool
    {
        'tpope/vim-fugitive',
        lazy = true,
        cmd = "Git",
    },
    {
        'rhysd/git-messenger.vim',
        init = function()
            vim.g.git_messenger_no_default_mappings = true
        end
    },
    {
        'f-person/git-blame.nvim',
        lazy = true,
        event = "BufReadPost",
    },
    {
        'lewis6991/gitsigns.nvim',
        lazy = true,
        event = "BufReadPost",
    },
    {
        'sindrets/diffview.nvim',
        lazy = true,
        cmd = "DiffviewOpen",
    },
    {
        "NeogitOrg/neogit",
        lazy = true,
        cmd = "Neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",         -- required
            "sindrets/diffview.nvim",        -- optional - Diff integration
            "nvim-telescope/telescope.nvim", -- optional
        },
        config = function ()
            require('neogit').setup({})
        end
    },
    -- Floating terminal
    {
        'voldikss/vim-floaterm',
        lazy = true,
        cmd = "FloatermToggle",
    },
    {
        "SmiteshP/nvim-navbuddy",
        lazy = true,
        cmd = "Navbuddy",
        dependencies = {
            "neovim/nvim-lspconfig",
            "SmiteshP/nvim-navic",
            "MunifTanjim/nui.nvim",
            "numToStr/Comment.nvim",        -- Optional
            "nvim-telescope/telescope.nvim" -- Optional
        }
    },

    -- Surround strings with markers
    {
        'tpope/vim-surround',
        lazy = true,
        event = "VeryLazy",
    },

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
            vim.api.nvim_create_autocmd("FileType", {
              pattern = "vimwiki",
              callback = function()
                vim.bo.filetype = "markdown"
              end,
            })
        end
    },
    'mattn/calendar-vim',

    -- Markdown preview
    {
        "iamcco/markdown-preview.nvim",
        lazy = true,
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },
    -- Rendering Markdown in nvim
    {
        'MeanderingProgrammer/render-markdown.nvim',
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
            'nvim-tree/nvim-web-devicons',
        },
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
    'ThePrimeagen/vim-be-good',

    -- Kubectl nvim
    'Ramilito/kubectl.nvim',

    -- Copilot
    {
        'github/copilot.vim',
        config = function ()
            vim.cmd(":Copilot disable")
        end
    },
    {
        'CopilotC-Nvim/CopilotChat.nvim',
        dependencies = {
            { 'nvim-lua/plenary.nvim', branch = 'master' }
        },
        build = "make tiktoken",
    },
    'mikeoz32/nvim-agent',
}
