vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

vim.g.limelight_conceal_ctermfg = 236
vim.g.limelight_conceal_guifg = '#444444'

vim.keymap.set('n', '<leader>l', '<cmd>Limelight<cr>')
vim.keymap.set('n', '<leader>L', '<cmd>Limelight!<cr>')
vim.keymap.set('x', '<leader>l', '<Plug>(Limelight)', { remap = true })

-- SQL
vim.api.nvim_set_keymap('n', '<leader>rr', "<cmd>.DB<cr>", { noremap = true, silent = true })
vim.cmd 'nmap <buffer> <expr> <leader>r db#op_exec()'
vim.cmd 'vmap <buffer> <expr> <leader>r db#op_exec()'
vim.cmd 'nnoremap <buffer> gss <cmd>.DB<cr>'
vim.cmd 'nmap <buffer> <expr> gs db#op_exec()'
vim.cmd 'vmap <buffer> <expr> gs db#op_exec()'

vim.api.nvim_set_keymap('n', '<leader>mp', '<cmd>Octo search author:wilkinson4 is:pr is:open<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>ra', '<cmd>Octo reviewer add<cr>', { noremap = true })

-- Harpoon
local harpoon = require("harpoon")
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find()
end

vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end,
    { desc = "Open harpoon window" })

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)

vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<leader>p", function() harpoon:list():prev() end)
vim.keymap.set("n", "<leader>n", function() harpoon:list():next() end)

-- Clear Harpoon list
vim.keymap.set("n", "<leader>x", function() harpoon:list():clear() end)


-- nvim Format
vim.keymap.set("n", "<leader><f4>", "<cmd>Format<cr>", { noremap = true })


vim.keymap.set("n", "<leader>tl", "<cmd>ToggleTerm direction=float<cr>", { noremap = true })


vim.keymap.set({ "n", "v" }, "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<LocalLeader>a", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
vim.keymap.set("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })

-- Expand 'cc' into 'CodeCompanion' in the command line
vim.cmd([[cab cc CodeCompanion]])
