local on_attach = function(_, bufnr)

    local bufmap = function(keys, func)
        vim.keymap.set('n', keys, func, { buffer = bufnr })
    end

    bufmap('<leader>r', vim.lsp.buf.rename)
    bufmap('<leader>A', vim.lsp.buf.code_action)

    bufmap('gd', vim.lsp.buf.definition)
    bufmap('gD', vim.lsp.buf.declaration)
    bufmap('gI', vim.lsp.buf.implementation)
    bufmap('gR', vim.lsp.buf.rename)
    bufmap('<leader>D', vim.lsp.buf.type_definition)

    bufmap('gr', require('telescope.builtin').lsp_references)
    bufmap('<leader>s', require('telescope.builtin').lsp_document_symbols)
    bufmap('<leader>S', require('telescope.builtin').lsp_dynamic_workspace_symbols)

    bufmap('K', vim.lsp.buf.hover)

    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
    end, {})
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

require('mason').setup()

require('mason-lspconfig').setup{
    ensure_installed = {
        'clangd',                               -- C/C++
        'cmake',                                -- CMake
        'cssls',                                -- CSS
        'dockerls',                             -- Docker
        'docker_compose_language_service',      -- Docker compose
        'fortls',                               -- Fortran
        'gradle_ls',                            -- Gradle
        'html',                                 -- Html
        'helm_ls',                              -- Helm
        'kotlin_language_server',               -- Kotlin
        'lua_ls',                               -- Lua
        'prosemd_lsp',                          -- Markdown
        'pylsp',                                -- Python
        'rust_analyzer',                        -- rust
        'taplo',                                -- TOML
        'texlab',                               -- LaTeX
        'yamlls',                               -- YAML

    }
}
require("mason-lspconfig").setup_handlers(
	{
	    function(server_name)
	        require("lspconfig")[server_name].setup {
	            on_attach = on_attach,
	            capabilities = capabilities
	        }
	    end,

	    ["lua_ls"] = function()
	        require('neodev').setup()
	        require('lspconfig').lua_ls.setup {
	            on_attach = on_attach,
	            capabilities = capabilities,
	            settings = {
	                Lua = {
	                    workspace = { checkThirdParty = false },
	                    telemetry = { enable = false },
	                },
	            }
	        }
	    end,
		["rust_analyzer"] = function()
			require("rust-tools").setup({
                server = {
                    on_attach = on_attach,
                    capabilities = capabilities,
                },
            })
		end,

        ["yamlls"] = function()
            require("lspconfig").yamlls.setup {
                on_attach = on_attach,
                filetypes = { 'yaml', 'yml' },
                settings = {
                    yaml = {
                        format = {
                            enable = true
                        },
                        hover = true,
                        completion = true,
                        validate = true,
                        schemas = {
                            kubernetes = "*.yaml",
                            ["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
                        },
                        schemaStore = {
                            enable = true,
                            url = "https://www.schemastore.org/api/json/catalog.json",
                        }
                    }
                },
                capabilities = capabilities,
            }
        end,
        -- The default settings in function(server_name) can be ovveridden if
        -- something as follows is defined
        --
        -- ["lsp_server_name"] = function()
        --     require('new_lsp_server_name').setup()
        -- end,

   }
)
