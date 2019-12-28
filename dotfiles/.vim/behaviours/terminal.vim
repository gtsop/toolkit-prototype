" Terminal
nmap <leader>` :rightb vert term<CR>source ~/.bash_profile<CR>clear<CR>
"nmap <leader>` :call OpenRightTerminal()<CR>

function! OpenRightTerminal()
  normal! :term<CR>echo 1<CR>
endfunction

" :help splitbelow
" https://vi.stackexchange.com/a/16800

" :help termwinsize
" https://vi.stackexchange.com/questions/16795/how-could-i-create-a-terminal-at-the-bottom#comment28830_16800
set termwinsize=0x100

" :help nobuflisted
" https://vi.stackexchange.com/questions/16708/switching-buffers-in-vi-while-skipping-any-terminal-in-vi-8-1
augroup termIgnore
    autocmd!
    autocmd TerminalOpen * set nobuflisted
    "autocmd VimEnter * :rightb vert term<CR>source ~/.bash_profile<CR>clear<CR>
augroup END

