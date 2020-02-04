execute pathogen#infect()

set nocp
syntax on
set noswapfile

let mapleader = "-"
let maplocalleader = "-"
map <SPACE> <leader>

" Move this to some short of utils file
" https://vi.stackexchange.com/a/13390
function! EchoWarning(msg)
  echohl WarningMsg
  echo "Warning"
  echohl None
  echon ': ' a:msg
endfunction

function! GetFileBase(ext = "")
  return expand('%:p:h') . "/" . expand('%:t:r') . a:ext
endfunction


so ~/.vim/behaviours/abbreviations.vim
so ~/.vim/behaviours/airline.vim
so ~/.vim/behaviours/ale.vim
so ~/.vim/behaviours/buffers.vim
so ~/.vim/behaviours/colorcolumn.vim
so ~/.vim/behaviours/comments.vim
so ~/.vim/behaviours/css.vim
so ~/.vim/behaviours/ctrlp.vim
so ~/.vim/behaviours/jsx.vim
so ~/.vim/behaviours/markdown.vim
so ~/.vim/behaviours/navigation.vim
so ~/.vim/behaviours/nerdtree.vim
so ~/.vim/behaviours/netrw.vim
so ~/.vim/behaviours/numbers.vim
so ~/.vim/behaviours/prettier.vim
so ~/.vim/behaviours/python.vim
so ~/.vim/behaviours/search.vim
so ~/.vim/behaviours/terminal.vim
so ~/.vim/behaviours/tests-bats.vim
so ~/.vim/behaviours/tests-jest.vim
so ~/.vim/behaviours/tests.vim
so ~/.vim/behaviours/whitespace.vim

"Full file path"
set statusline+=%F
set laststatus=2

"Supposedly helps with cursor copying"
set mouse+=a

"Random crap
inoremap <c-s> <Esc>:w<CR>
nnoremap <c-s> <Esc>:w<CR>

nmap <leader>q :q!<CR>
nmap <leader>Q :qa!<CR>

nnoremap <silent> <leader>a :ArgWrap<CR>

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>gf :e <cfile><cr>

set formatoptions-=cro

" I don't even remember what these are anymore
set list
set listchars=tab:>-,trail:~
map <leader>l :set list!<cr>
set backspace=indent,eol,start


" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
nmap <leader>ue :UltiSnipsEdit<cr>
