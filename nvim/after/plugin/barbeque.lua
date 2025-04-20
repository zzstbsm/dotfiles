-- require('barbecue').setup({

    ---Whether to attach navic to language servers automatically.
    -- attach_navic = false

-- })
require('barbecue.ui').toggle(true)

vim.api.nvim_create_autocmd({
    "WinScrolled",
    "WinResized",
    "BufWinEnter",
    "CursorHold",
    "InsertLeave",

    -- include this if you have set `show_modified` to `true`
    "BufModifiedSet",
}, {
    group = vim.api.nvim_create_augroup("barbecue.updater", {}),
    callback = function()
        require("barbecue.ui").update()
    end,
})
