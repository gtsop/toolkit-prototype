"Identation"
filetype plugin indent on
set tabstop=2
set shiftwidth=2
set expandtab

"Trim whitespace on save"
autocmd BufWritePre * %s/\s\+$//e
