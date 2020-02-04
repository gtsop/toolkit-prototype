" Pluggin depedency: https://github.com/aliou/bats.vim

" Run tests
function! RunBatsTests()

  let test_file = GetFileBase(".bats")

  if filereadable(test_file)
    execute '!cd %:h; bats ' . test_file
  else
    call EchoWarning("No tests found!")
  endif
endfunction

" Go to test/source file
command! -bar EditBatsTest   execute 'edit' GetFileBase(".bats")
command! -bar EditBatsSource execute 'edit' GetFileBase(".sh")

augroup bats
  autocmd!

  " Enable test/source file naviation with local leader
  autocmd FileType bats nnoremap <LocalLeader>s :GoToBatsSource<CR>
  autocmd FileType sh   nnoremap <LocalLeader>t :GoToBatsTest<CR>

  " Auto run test on save
  autocmd BufWritePost *.bats call RunBatsTests()
  autocmd BufWritePost *.sh   call RunBatsTests()
augroup END


