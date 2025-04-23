vim.keymap.set("i", "<C-Tab>", 'copilot#Accept("<CR>")', {
    expr = true,
    silent = true,
    script = true,
})
