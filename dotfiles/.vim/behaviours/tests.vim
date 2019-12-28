" React
command! -bar CreateJestTestReactComponent execute 'edit' expand('%:p:h') . "/" . expand('%:t:r') . ".test." . expand('%:e')

command! -bar ScaffoldJestTestReactComponent execute 'read ~/.vim/templates/skeleton.test.js'

command JestTestReactComponent CreateJestTestReactComponent|ScaffoldJestTestReactComponent

" Bats
command! -bar CreateBatsTest execute 'edit' expand('%:p:h') . "/" . expand('%:t:r') . ".bats"

" Run tests
augroup npmtest
  autocmd!
  autocmd BufWritePost *.test.js :!npm test
augroup END

" Jest


" Mocha
iabbrev mochalint /* global describe, it, require */

iabbrev mochadesc describe('', function () {<cr>})<Up><right><right><right><right><right><right><right><right>

iabbrev mochait it('', function () {<cr>})<Up><right><right>
