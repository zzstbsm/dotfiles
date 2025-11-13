-- Setup on_attach
local function on_attach(bufnr)

    local api = require("nvim-tree.api")

    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- Default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- Open tree if is a directory
    -- Open file and close NvimTree otherwise
    local function edit_or_open()
        local node = api.tree.get_node_under_cursor()

        if node.nodes ~= nil then
            -- expand or collapse folder
            api.node.open.edit()
        else
            -- open file
            api.node.open.edit()
            -- Close the tree if file was opened
            api.tree.close()
        end
    end

    -- Open as vsplit on current node
    -- Useful for preview mode
    local function vsplit_preview()
        local node = api.tree.get_node_under_cursor()

        if node.nodes ~= nil then
            -- expand or collapse folder
            api.node.open.edit()
        else
            -- open file as vsplit
            api.node.open.vertical()
        end

        -- Finally refocus on tree if it was lost
        api.tree.focus()
    end

    -- Stage/unstage files from the tree
    local git_add = function()
        local node = api.tree.get_node_under_cursor()
        local gs = node.git_status.file

        -- If the current node is a directory get children status
        if gs == nil then
            gs = (node.git_status.dir.direct ~= nil and node.git_status.dir.direct[1])
            or (node.git_status.dir.indirect ~= nil and node.git_status.dir.indirect[1])
        end

        -- If the file is untracked, unstaged or partially staged, we stage it
        if gs == "??" or gs == "MM" or gs == "AM" or gs == " M" then
            vim.cmd("silent !git add " .. node.absolute_path)

            -- If the file is staged, we unstage
        elseif gs == "M " or gs == "A " then
            vim.cmd("silent !git restore --staged " .. node.absolute_path)
        end

        api.tree.reload()
    end

    -- Resize view
    local nvim_tree_width_default = 30
    local nvim_tree_width = nvim_tree_width_default
    local view_size_set_default = function()
       nvim_tree_width = nvim_tree_width_default
       vim.cmd.NvimTreeResize(nvim_tree_width)
    end

    local function change_view_size(offset)
        nvim_tree_width = nvim_tree_width + offset

        if nvim_tree_width <= 0 then
            view_size_set_default()
            api.tree.close()
            return
        end

        vim.cmd.NvimTreeResize(nvim_tree_width)
    end

    local view_size_increase = function()
        change_view_size(10)
    end
    local view_size_decrease = function()
        change_view_size(-10)
    end

    local compare_two_marked = function()

        local is_directory_or_symlink_dir = function(node)
            if (
                node.type == "file"                     -- file
                or (                                    -- link to file
                    node.type == "link" and
                    node.fs_stat_target.type == "file"
                )
            ) then
                return false
            end
            return true
        end

        local marked_list = api.marks.list()
        local marked_number = 0
        -- Count number of marked files
        for _, value in pairs(marked_list) do
            marked_number = marked_number + 1
            if is_directory_or_symlink_dir(value) then
                vim.notify(
                    "Please select two files for comparison, directories are not allowed",
                    vim.log.levels.WARN
                )
                return
            end
        end
        if marked_number == 2 then
            -- Extract the nodes
            local first = marked_list[1]
            local second = marked_list[2]

            api.tree.close()
            vim.cmd(string.format(
                ":e %s | diffthis | vsplit %s | diffthis", first.absolute_path, second.absolute_path
            ))
        elseif marked_number == 0 then
            vim.notify("Mark two files in order to use comparison", vim.log.levels.WARN)
            return
        else
            vim.notify("Only two files marked is allowed for comparison", vim.log.levels.WARN)
            return
        end
    end

    -- on_attach
    vim.keymap.set("n", "l", edit_or_open, opts("Edit Or Open"))
    vim.keymap.set("n", "L", vsplit_preview, opts("Vsplit Preview"))
    vim.keymap.set("n", "h", api.tree.close, opts("Close"))
    vim.keymap.set("n", "H", api.tree.collapse_all, opts("Collapse All"))
    vim.keymap.set("n", "ga", git_add, opts("Git Add"))
    vim.keymap.set("n", "gr", api.git.reload, opts("Update git status"))
    vim.keymap.set("n", "<C-h>", view_size_decrease, opts("Decrease view"))
    vim.keymap.set("n", "<C-l>", view_size_increase, opts("Increase view"))
    vim.keymap.set("n", "<C-c>", compare_two_marked, opts("Compare two marked files"))
    vim.keymap.set("n", "<leader>d", view_size_set_default, opts("Set default view size"))
    vim.keymap.set("n", "C", api.marks.clear, opts("Clear all marked files"))
    vim.keymap.set("n", "O", api.tree.change_root_to_node, opts("CD to directory"))
end

-- Setup sorting
local function natural_cmp(left, right)
    left = left.name:lower()
    right = right.name:lower()

    if left == right then
        return false
    end

    for i = 1, math.max(string.len(left), string.len(right)), 1 do
        local l = string.sub(left, i, -1)
        local r = string.sub(right, i, -1)

        if type(tonumber(string.sub(l, 1, 1))) == "number" and type(tonumber(string.sub(r, 1, 1))) == "number" then
            local l_number = tonumber(string.match(l, "^[0-9]+"))
            local r_number = tonumber(string.match(r, "^[0-9]+"))

            if l_number ~= r_number then
                return l_number < r_number
            end
        elseif string.sub(l, 1, 1) ~= string.sub(r, 1, 1) then
            return l < r
        end
    end
end


-- Setup apply setup
require('nvim-tree').setup({
    on_attach = on_attach,
    sort_by = function(nodes)
        table.sort(nodes, natural_cmp)
    end,
    renderer = {
        indent_markers = {
            enable = true
        },
    },
    diagnostics = {
        enable = true,
        show_on_dirs = true,
    }
})

-- Global Keymap
vim.api.nvim_set_keymap('n', '<C-j>', ':NvimTreeToggle<cr>', { silent = true, noremap = true } )

