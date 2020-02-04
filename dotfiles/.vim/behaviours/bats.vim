augroup bats
  autocmd!
  autocmd BufNewFile,BufRead *.bats set syntax=sh
  autocmd BufWritePost *.bats :!cd %:h; bats %:t
augroup END
