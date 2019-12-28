" NERD TREE"
let NERDTreeShowHidden=1

" Toggle nerdtree
" https://vi.stackexchange.com/questions/9967/how-do-i-open-and-close-nerdtree-toggle-nerdtree-view-using-a-single-keystroke
nmap <leader>b :NERDTreeToggle<CR>:wincmd p<CR>

" Automatically open nerdtree on startup
" https://stackoverflow.com/questions/1447334/how-do-you-add-nerdtree-to-your-vimrc
" autocmd VimEnter * NERDTree
" autocmd VimEnter * wincmd p

" Automatically close nerdtree if it's the last buffer
" https://stackoverflow.com/questions/2066590/automatically-quit-vim-if-nerdtree-is-last-and-only-buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
