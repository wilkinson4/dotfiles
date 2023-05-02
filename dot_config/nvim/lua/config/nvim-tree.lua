require 'nvim-tree'.setup {
    hijack_netrw = true,
    diagnostics = { enable = true },
    view = {
        number = true,
        relativenumber = true,
        mappings = {
            list = {
                -- NOTE: default to editing the file in place, netrw-style
                { key = { "<C-e>", "o", "<CR>" }, action = "edit_in_place" }, -- NOTE: override the "split" to avoid treating nvim-tree
                -- window as special. Splits will appear as if nvim-tree was a
                -- regular window
                { key = "<C-v>", action = "split_right", action_cb = function(node)
                    vim.cmd("vsplit " .. vim.fn.fnameescape(node.absolute_path))
                end },
                { key = "<C-x>", action = "split_bottom", action_cb = function(node)
                    vim.cmd("split " .. vim.fn.fnameescape(node.absolute_path))
                end }, -- NOTE: override the "open in new tab" mapping to fix the error
                -- that occurs there
                { key = "<C-t>", action = "new_tab", action_cb = function(node)
                    vim.cmd("tabnew " .. vim.fn.fnameescape(node.absolute_path))
                end }
            }
        }
    },
    actions = {
        change_dir = {
            -- NOTE: netrw-style, do not change the cwd when navigating
            enable = false
        },
        open_file = {
            -- NOTE: prevent nvim-tree from re-appearing after opening a new window
            -- (changes the way autocommands are registered)
            quit_on_open = true
        }
    },
    renderer = {
        highlight_git = true,
        group_empty = true
    }
}

local function toggle_replace()
    local view = require "nvim-tree.view"
    local api = require "nvim-tree.api"
    if view.is_visible() then
        api.tree.close()
    else
        require "nvim-tree".open_replacing_current_buffer()
    end
end

vim.keymap.set('n', '-', toggle_replace)

-- NOTE: disable fixed nvim-tree width and height
-- to allow creating splits naturally
local winopts = require("nvim-tree.view").View.winopts
winopts.winfixwidth = false
winopts.winfixheight = false
