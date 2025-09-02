local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
}

local navic = require('nvim-navic')
local navbuddy = require('nvim-navbuddy')
local telescope = require('telescope.builtin')

local on_attach = function(client, bufnr)

    local bufmap = function(keys, func, desc)
        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end

    if client.server_capabilities.documentSymbolProvider then
        -- On attach navic
        navic.attach(client, bufnr)

        -- On attach navbuddy
        navbuddy.attach(client, bufnr)
    end

    bufmap('<C-n>', navbuddy.open, 'Open Navbuddy')


    bufmap('<leader>r', vim.lsp.buf.rename)
    bufmap('<leader>A', vim.lsp.buf.code_action)

    bufmap('gd', vim.lsp.buf.definition, "Go to symbol definition")
    bufmap('gD', vim.lsp.buf.declaration, "Go to symbol declaration")
    bufmap('gI', vim.lsp.buf.implementation, "Open window with symbol implementation")
    bufmap('gR', vim.lsp.buf.rename, "Rename the symbol in the code")
    bufmap('<leader>D', vim.lsp.buf.type_definition)

    bufmap('gr', telescope.lsp_references)
    bufmap('<leader>s', telescope.lsp_document_symbols)
    bufmap('<leader>S', telescope.lsp_dynamic_workspace_symbols)

    bufmap(
        '<leader>d',
        function()
            vim.diagnostic.open_float({ scope = "cursor" })
        end,
        "Open diagnostic window"
    )
    bufmap('K', vim.lsp.buf.hover, "Hover on the symbol")

    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
    end, {})
end

require('mason').setup()

require('mason-lspconfig').setup({
    ensure_installed = {
        'clangd',                               -- C/C++
        'cmake',                                -- CMake
        'cssls',                                -- CSS
        'dockerls',                             -- Docker
        'docker_compose_language_service',      -- Docker compose
        'fortls',                               -- Fortran
        'gopls',                                -- Go
        'gradle_ls',                            -- Gradle
        'html',                                 -- Html
        'helm_ls',                              -- Helm
        'kotlin_language_server',               -- Kotlin
        'lua_ls',                               -- Lua
        'prosemd_lsp',                          -- Markdown
        -- 'pylsp',                                -- Python
        'pyright',                              -- Python
        'rust_analyzer',                        -- rust
        'taplo',                                -- TOML
        'texlab',                               -- LaTeX
        'yamlls',                               -- YAML

    },
    automatic_installation = true
})

vim.lsp.config('*', {
    on_attach = on_attach,
    capabilities = capabilities,
})

vim.lsp.config('lua_ls', {
    on_attach = on_attach,
    capabilities = capabilities,
	settings = {
	    Lua = {
	        workspace = { checkThirdParty = false },
	        telemetry = { enable = false },
            diagnostics = {
                disable = { "missing-fields" },
            }
	    },
	}
})
--
-- vim.lsp.config('rust_analyzer', {
--     on_attach = on_attach,
--     capabilities = capabilities,
-- })

vim.lsp.config('yamlls', {
    on_attach = on_attach, filetypes = { 'yaml', 'yml' },
    settings = {
        yaml = {
            format = {
                enable = true
            },
            hover = true,
            completion = true,
            validate = true,
            schemas = {
                kubernetes = "{k8s,kube{rnetes,}/}*.yaml",
                ["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
                ["https://raw.githubusercontent.com/docker/compose/master/compose/config/compose_spec.json"] = "docker-compose*.{yml,yaml}",
                ["https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/argoproj.io/application_v1alpha1.json"] = "argocd-application.yaml",
            },
            schemaStore = {
                enable = true,
                url = "https://www.schemastore.org/api/json/catalog.json",
            }
        }
    },
    capabilities = capabilities,
})

-- require("mason-lspconfig").setup_handlers(
-- 	{
-- 	    function(server_name)
-- 	        require("lspconfig")[server_name].setup {
-- 	            on_attach = on_attach,
-- 	            capabilities = capabilities
-- 	        }
-- 	    end,
--
-- 	    ["lua_ls"] = function()
-- 	        require('neodev').setup()
-- 	        require('lspconfig').lua_ls.setup {
-- 	            on_attach = on_attach,
-- 	            capabilities = capabilities,
-- 	            settings = {
-- 	                Lua = {
-- 	                    workspace = { checkThirdParty = false },
-- 	                    telemetry = { enable = false },
--                         diagnostics = {
--                             disable = { "missing-fields" },
--                         }
-- 	                },
-- 	            }
-- 	        }
-- 	    end,
-- 		["rust_analyzer"] = function()
-- 			require("rust-tools").setup({
--                 server = {
--                     on_attach = on_attach,
--                     capabilities = capabilities,
--                 },
--             })
-- 		end,
--
--         ["yamlls"] = function()
--             require("lspconfig").yamlls.setup {
--                 on_attach = on_attach,
--                 filetypes = { 'yaml', 'yml' },
--                 settings = {
--                     yaml = {
--                         format = {
--                             enable = true
--                         },
--                         hover = true,
--                         completion = true,
--                         validate = true,
--                         schemas = {
--                             kubernetes = "{k8s,kube{rnetes,}/}*.yaml",
--                             ["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
--                             ["https://raw.githubusercontent.com/docker/compose/master/compose/config/compose_spec.json"] = "docker-compose*.{yml,yaml}",
--                             ["https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/argoproj.io/application_v1alpha1.json"] = "argocd-application.yaml",
--                         },
--                         schemaStore = {
--                             enable = true,
--                             url = "https://www.schemastore.org/api/json/catalog.json",
--                         }
--                     }
--                 },
--                 capabilities = capabilities,
--             }
--         end,
--
--         -- ["pylsp"] = function()
--         --     require("lspconfig").pylsp.setup {
--         --         on_attach = on_attach,
--         --         capabilities = capabilities,
--         --         cmd = { "pylsp" },
--         --         settings = {
--         --             pylsp = {
--         --                 plugins = {
--         --                     pylint = { enabled = true },
--         --                     rope_autoimport = {
--         --                         code_actions = { enabled = false },
--         --                         completions = { enabled = false }
--         --                     }
--         --                 }
--         --             }
--         --         }
--         --     }
--         -- end
--         --
--         --
--         --
--         -- The default settings in function(server_name) can be ovveridden if
--         -- something as follows is defined
--         --
--         -- ["lsp_server_name"] = function()
--         --     require('new_lsp_server_name').setup()
--         -- end,
--
--    }
-- )
