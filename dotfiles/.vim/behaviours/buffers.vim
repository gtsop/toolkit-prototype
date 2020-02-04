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
