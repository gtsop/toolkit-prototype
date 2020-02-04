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
