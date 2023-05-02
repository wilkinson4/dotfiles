autocmd TermOpen * setlocal nonumber norelativenumber bufhidden=hide sidescrolloff=0

" more convenient escape
tnoremap <leader><esc> <c-\><c-n>

" split navigation
tnoremap <m-[> <c-\><c-n>
tnoremap <m-h> <c-\><c-n><c-w>h
tnoremap <m-j> <c-\><c-n><c-w>j
tnoremap <m-k> <c-\><c-n><c-w>k
tnoremap <m-l> <c-\><c-n><c-w>l

nnoremap <leader>\ :VTerm<CR>
nnoremap <leader>- :STerm<CR>
nnoremap <leader>\| :VTermRepo<CR>
nnoremap <leader>_ :STermRepo<CR>

nmap gxx <Plug>(neoterm-repl-send-line)
nmap gx <Plug>(neoterm-repl-send)
xmap gx <Plug>(neoterm-repl-send)

let g:neoterm_default_mod='belowright'

augroup term_settings
  autocmd TermOpen * setlocal nonumber norelativenumber bufhidden=hide sidescrolloff=0
augroup end

augroup term_insert
  " go into insert mode if switching to a terminal buffer
  autocmd BufEnter term://* startinsert
  autocmd BufLeave term://* stopinsert
augroup end
