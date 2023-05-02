command! -nargs=* VTerm :vsp
  \ | execute 'terminal' <args>
command! -nargs=* VTermRepo :vsp
  \ fnameescape(FugitiveWorkTree())
  \ | execute 'lcd' fnameescape(FugitiveWorkTree())
  \ | execute 'terminal' <args>
command! -nargs=* STerm :sp
  \ | execute 'terminal' <args>
command! -nargs=* STermRepo :sp
  \ fnameescape(FugitiveWorkTree())
  \ | execute 'lcd' fnameescape(FugitiveWorkTree())
  \ | execute 'terminal' <args>
command! -nargs=* TTerm :tabnew
  \ | execute 'terminal' <args>
command! -nargs=* TTermRepo :tabedit
  \ fnameescape(FugitiveWorkTree())
  \ | execute 'lcd' fnameescape(FugitiveWorkTree())
  \ | execute 'terminal' <args>

" amend without editing commit message
command! Gamend Git commit --amend
command! Gnoedit Git commit --amend --no-edit

command! -range FormatJSON :<line1>,<line2>call FormatJSON()

command! -nargs=* Gpc execute('Git push --set-upstream origin '.FugitiveHead().' '.<q-args>)
command! -nargs=* Gpnv execute('Git push --set-upstream origin --no-verify '.FugitiveHead().' '.<q-args>)

command! ToggleSqlScratch :call ToggleSqlScratch(<q-mods>)

command! ReadPreview call ReadPreview()

" show highlight stack
" should show transparent groups
" https://github.com/b0o/vim-HiLinkTrace/blob/343b5a51cd15f167dff97df0587376ba2e4d52f6/plugin/hilinks.vim#L77
function! SynStack()
  let l:syns = synstack(line('.'), col('.'))
  call map(l:syns, {key, item -> [synIDattr(item, 'name'), synIDattr(synIDtrans(item), 'name')]})
  call map(l:syns, {key, pair -> ('[' . get(pair, 0) . '->' . get(pair, 1) . ']')})
  echo join(l:syns, ' => ')
endfunction

command! SynStack :call SynStack()
