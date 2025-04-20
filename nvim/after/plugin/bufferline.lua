require("bufferline").setup {
    options = {
        mode = "tabs",
        numbers = "ordinal",
        diagnostics = 'nvim_lsp',
        separator_style = 'slant',
        hover = {
            enabled = true,
            delay = 25,
            reveal = { 'close' }
        },
        offsets = {
            {
                filetype = "NvimTree",
                text = " 󰉋 File Explorer",
                text_align = "center",
                separator = true,
            },
        },
        color_icons = true,
    }
}
