local opts = { noremap=true, silent=true }

vim.api.nvim_set_keymap('n', '<leader>rr', "<cmd>.DB<cr>", opts)
vim.cmd 'nmap <buffer> <expr> <leader>r db#op_exec()'
vim.cmd 'vmap <buffer> <expr> <leader>r db#op_exec()'
vim.cmd 'nnoremap <buffer> gss <cmd>.DB<cr>'
vim.cmd 'nmap <buffer> <expr> gs db#op_exec()'
vim.cmd 'vmap <buffer> <expr> gs db#op_exec()'
