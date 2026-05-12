local cmp = require('blink.cmp')

--- @module 'blink.cmp'
--- @class blink.cmp.Keymap
local keymap = {
    preset = 'default',

    -- Select the [n]ext item
    ['<C-n>'] = { 'select_next', 'fallback' },
    -- Select the [p]revious item
    ['<C-p>'] = { 'select_prev', 'fallback' },

    -- Show and hide documentation
    ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },    -- Scroll the documentation window [b]ack / [f]orward
    ['<C-b>'] = { 'scroll_documentation_up' },
    ['<C-f>'] = { 'scroll_documentation_down' },
    ['<M-n>'] = {
        cmp.scroll_documentation_up(1)
    },
    ['<M-p>'] = {
        cmp.scroll_documentation_down(1)
    },

    -- Accept ([y]es) the completion.
    --  This will auto-import if your LSP supports it.
    --  This will expand snippets if the LSP sent a snippet.
    ['<C-y>'] = { 'accept' },
    ['<CR>'] = { 'accept', 'fallback' },

    -- Tab to navigate between the 
    ['<Tab>'] = { 'select_next', 'fallback'},
    ['<S-Tab>'] = { 'select_prev', 'fallback' }
}

--- @module 'blink.cmp'
--- @class blink.cmp.Source
local sources = {
    default = {
        'lsp',
        'path',
        'snippets',
        'buffer'
    }
}

local fuzzy = {
    implementation = 'prefer_rust_with_warning'
}

cmp.setup(
    {
        keymap = keymap,
        sources = sources,
        fuzzy = fuzzy
    }
)
