return {
  "nathom/tmux.nvim",
  config = function()
    vim.api.nvim_set_keymap('n', '<m-h>', [[<cmd>lua require('tmux').move_left()<cr>]], { silent = true })
    vim.api.nvim_set_keymap('n', '<m-j>', [[<cmd>lua require('tmux').move_down()<cr>]], { silent = true })
    vim.api.nvim_set_keymap('n', '<m-k>', [[<cmd>lua require('tmux').move_up()<cr>]], { silent = true })
    vim.api.nvim_set_keymap('n', '<m-l>', [[<cmd>lua require('tmux').move_right()<cr>]], { silent = true })
    vim.api.nvim_set_keymap('i', '<m-h>', [[<cmd>lua require('tmux').move_left()<cr>]], { silent = true })
    vim.api.nvim_set_keymap('i', '<m-j>', [[<cmd>lua require('tmux').move_down()<cr>]], { silent = true })
    vim.api.nvim_set_keymap('i', '<m-k>', [[<cmd>lua require('tmux').move_up()<cr>]], { silent = true })
    vim.api.nvim_set_keymap('i', '<m-l>', [[<cmd>lua require('tmux').move_right()<cr>]], { silent = true })
  end
}
