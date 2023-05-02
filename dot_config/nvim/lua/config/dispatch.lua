vim.g.dispatch_no_tmux_make = 1
vim.g.dispatch_no_tmux_start = 1
vim.g.dispatch_no_screen_make = 1
vim.g.dispatch_no_screen_start = 1

local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<leader>d', '<cmd>Dispatch<cr>', opts)
