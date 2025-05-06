vim.keymap.set("i", "<C-\\>", 'copilot#Accept("<CR>")', {
    expr = true,
    silent = true,
    script = true,
    replace_keycodes = false,
})
