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
