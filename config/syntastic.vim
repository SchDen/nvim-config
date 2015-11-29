
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" JSHint
" sudo npm i -g jshint
"let g:syntastic_javascript_checkers = ['jshint']
" ESLint
" sudo npm i -g eslint
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_args = "--cache"

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height=3
let g:syntastic_warning_symbol = "⚠"
