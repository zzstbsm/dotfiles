vim.notify = require('notify')

require('notify').setup({
    render = "wrapped-compact",
    max_width = math.floor(vim.o.columns / 2), -- Half screen as max width
    background_colour = "#000000",
})
