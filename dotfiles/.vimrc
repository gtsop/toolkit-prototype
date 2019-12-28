execute pathogen#infect()

set nocp
syntax on
set number
set noswapfile

let g:gutentags_trace = 1
let g:gutentags_ctags_executable = '/usr/local/Cellar/ctags/5.8_1/bin/ctags'


let mapleader = ";"
let maplocalleader = "-"
map <SPACE> <leader>

so ~/.vim/behaviours/colorcolumn.vim
so ~/.vim/behaviours/comments.vim
so ~/.vim/behaviours/navigation.vim
so ~/.vim/behaviours/nerdtree.vim
so ~/.vim/behaviours/search.vim
so ~/.vim/behaviours/terminal.vim
so ~/.vim/behaviours/tests.vim
so ~/.vim/behaviours/tests-jest.vim

"Full file path"
set statusline+=%F
set laststatus=2

"Identation"
filetype plugin indent on
set tabstop=2
set shiftwidth=2
set expandtab

"Markdown support"
let g:vim_markdown_folding_disabled = 1

"Trim whitespace on save"
autocmd BufWritePre * %s/\s\+$//e

"Supposedly helps with cursor copying"
set mouse+=a

"Supposedly helps with the file searching"
set path+=**
set wildmode=longest,list,full
set wildmenu


set backspace=indent,eol,start

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

"https://joshldavis.com/2014/04/05/vim-tab-madness-buffers-vs-tabs/"
""
" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>

" Move to the next buffer
nmap <leader>] :bnext<CR>
nmap <leader>} :bnext<CR>

" Move to the previous buffer
nmap <leader>[ :bprevious<CR>
nmap <leader>{ :bprevious<CR>

" Disable buff-kill mappings
let g:BufKillCreateMappings=0

" Delete buffer without deleting window
nmap <leader>w :BD<CR>

" Save file
nmap <leader>s :w<CR>
inoremap <c-s> <Esc>:w<CR>
nnoremap <c-s> <Esc>:w<CR>


nmap <leader>q :q!<CR>
nmap <leader>Q :qa!<CR>

set list
set listchars=tab:>-,trail:~

map <leader>l :set list!<cr>

" Deletion for netrw"
let g:netrw_localrmdir='rm -r'

" Jinja2 stuff"
autocmd BufNewFile,BufRead *.html,*.htm,*.shtml,*.stm set ft=jinja

" CTRL P "
let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlPMRU'

let g:jsx_ext_required = 0

" Relative numbers
" https://jeffkreeftmeijer.com/vim-number/
set number relativenumber

nnoremap <silent> <leader>a :ArgWrap<CR>

let g:autopep8_on_save = 1
let g:autopep8_disable_show_diff=1
nmap <silent> <C-_> <Plug>(pydocstring)

" Template hightlight
let g:jsx_ext_required = 0 " Works on files other than .jsx

if has('autocmd')
  " Support `-` in css property names
  augroup VimCSS3Syntax
    autocmd!
    autocmd FileType css setlocal iskeyword+=-
  augroup END

  " call jspretmpl#register_tag('gql', 'graphql')
  autocmd FileType javascript.jsx JsPreTmpl
  autocmd FileType javascript JsPreTmpl
endif

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

iabbrev cydescribe describe('EDIT_ME', function () {<cr>})
iabbrev cyit it('EDIT_ME', function () {<cr>})

augroup bats
  autocmd!
  autocmd BufNewFile,BufRead *.bats set syntax=sh
  autocmd BufWritePost *.bats :!cd %:h; bats %:t
augroup END

iabbrev shebangbats #!/usr/bin/env bats
iabbrev shebangbash #!/usr/bin/env bash

iabbrev batstest @test "EDIT_ME" {<cr>}

iabbrev jsfunc function () {<cr>}
iabbrev importreact import React from "react";
iabbrev importstyled import styled from "styled-components";
iabbrev importrenderer import renderer from "react-test-renderer";

nnoremap <leader>gf :e <cfile><cr>

set formatoptions-=cro

augroup ctags
  autocmd!
  " autocmd BufWritePost *.js :silent exec "!(ctags -R . &) 2>& /dev/null"
augroup END
