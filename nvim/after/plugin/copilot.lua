-- Copilot inline
vim.keymap.set("i", "<C-\\>", 'copilot#Accept("<CR>")', {
    expr = true,
    silent = true,
    script = true,
    replace_keycodes = false,
})

-- -- Copilot NVIM Agent
-- require('nvim-agent').setup({
--     api = {
--         provider = "github-copilot",
--         model = "gpt-41-copilot",
--     },
--     keymaps = {
--         toggle_chat = "<leader>cc",
--         explain_code = "<leader>ce",
--         generate_code = "<leader>cg",
--         refactor_code = "<leader>cr",
--     }
-- })

-- Copilot Chat
-- NO CONFIG
