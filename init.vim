"------------------------------------------------
" BASE SETTINGS
"------------------------------------------------  
syntax enable
set path=$PWD/**

" Disable beep
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Local http://ftp.vim.org/pub/vim/runtime/spell/
setlocal spell spelllang=ru_yo,en_us

" Russian key
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan
" /Russian key

" Swap files
set directory=$HOME/.config/nvim/tmp/swapfiles

set history=500

" Set space key - <leader>
let mapleader = " "

" Special chars
set list listchars=tab:⋮\ ,trail:·

" FocusGained and FocusLost autocommand events are not working in terminal vim.
" https://github.com/tmux-plugins/vim-tmux-focus-events
set autoread

" Folding
set foldenable
set foldmethod=syntax
set foldlevelstart=10

"------------------------------------------------
" /BASE SETTINGS
"------------------------------------------------

"------------------------------------------------
" THEME
"------------------------------------------------
set t_Co=256
set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set termencoding=utf-8<Paste>
let base16colorspace=255
colorscheme base16-twilight
set synmaxcol=240                       " No syntax highlighting on long lines.
set background=dark
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
set cursorline                          " Highlight the line with the cursor.
set hlsearch                            " Highlight search terms.
set incsearch                           " Highlight matches as you type.
set laststatus=2                        " Always show the status line.
set lazyredraw                          " Don't redraw screen when excuting
                                        " macros, registers, etc.
"set list                                " Show invisible characters.
set mouse=a                             " Enable mouse support.
set mousehide                           " Hide the mouse cursor when typing.
set number
set scrolloff=4                         " Keep 4 lines above/below the cursor.
set shiftwidth=4                        " Use four spaces when auto-indenting.
set smartindent                         " Smart autoindenting for new lines.
set smarttab                            " Use shiftwidth when using <Tab> in
                                        " front of a line.
set nowrap                              " Не переносить строку
set autoindent                          " копирует отступы с текущей строки при добавлении новой.
set softtabstop=4                       " How many spaces should a tab be
set tabstop=4                           " Количество пробелов, которыми символ табуляции отображается в тексте.
                                        " when hitting <Tab> or backspace.
set ignorecase                          " Ignore case while searching.
set cin                                 " отступы в стиле Си
set expandtab                           " Преобразование Таба в пробелы

set wildmenu                            " Autocomplete commands.
set wildmode=longest:full,full          " Autocomplete til the longest common
                                        " string and the next full match.
" Отключение подсветки после 120 строк 
if exists('+colorcolumn')
  set colorcolumn=120
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>100v.\+', -1)
endif
"------------------------------------------------
" /THEME
"------------------------------------------------

"------------------------------------------------
" BASE BINDS
"------------------------------------------------

" @TODO - Copy in system bufer
"nnoremap y "+y
"vnoremap y "+y
" /

" Tab/Shift + tab
vmap <Tab> >gv
vmap <S-Tab> <gv
inoremap <Tab> <C-t>
inoremap <S-Tab> <C-d>
nnoremap <Tab> >>
nnoremap <S-Tab> <<
" /

" Select in quotes
nnoremap <C-a> vi'
" /

" No move to next
nnoremap * *N
" /

" В визуальном режиме по команде * подсвечивать выделение
vnoremap * y :execute ":let @/=@\""<CR> :execute "set hlsearch"<CR>

" Hide heightlight 
map <silent><leader>h :nohl<CR> :set nospell<CR>

" Find 
map <leader>f :find 

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>
" /

" Use space+w for saving, also in Insert mode
noremap <leader>w :write<CR>
vnoremap <leader>w <esc>:write<CR>
" /
"inoremap <leader>w <esc>:write<CR>

" Use space+w for saving, also in Insert mode
noremap <leader>j :bp<CR>
noremap <leader>k :bn<CR>
" /

" Set en local after esc key
"imap :!setxkbmap us:!setxkbmap us,ru
"nmap :!setxkbmap us:!setxkbmap us,ru
" /

" JSON formating
nmap =j :%!python -m json.tool<CR>

"------------------------------------------------
" /BASE BINDS
"------------------------------------------------

"------------------------------------------------
" Functions
"------------------------------------------------

"--- Автодополнение на Tab
function! SuperCleverTab()
    if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
        return "\<Tab>"
    else
        return "\<C-p>"
    endif
endfunction

inoremap <Tab> <C-R>=SuperCleverTab()<cr>
"--- /Автодополнение на Tab

"--- Удаление лидирующих пробелов
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd FileType javascript,php,python autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
"--- /Удаление лидирующих пробелов

"------------------------------------------------
" /Functions
"------------------------------------------------

"------------------------------------------------
" INCLUDE PLUGINS
"------------------------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required

"--- Initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()

"--- POWERLINE
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/nvim/'}

"--- VundleVim
Plugin 'VundleVim/Vundle.vim'

"--- The NERD Tree
" https://github.com/scrooloose/nerdtree
Plugin 'scrooloose/nerdtree'

"--- vim-airline
" https://github.com/bling/vim-airline
Plugin 'bling/vim-airline'

"--- fugitive.vim
" https://github.com/tpope/vim-fugitive
Plugin 'tpope/vim-fugitive'

"--- syntastic
" https://github.com/scrooloose/syntastic
Plugin 'scrooloose/syntastic'

"--- Miscellaneous auto-load Vim scripts
" https://github.com/xolox/vim-misc
Plugin 'xolox/vim-misc'

"--- Extended session management for Vim
" https://github.com/xolox/vim-session
Plugin 'xolox/vim-session'

"--- Emmet-vim
" https://github.com/mattn/emmet-vim
Plugin 'mattn/emmet-vim'

"--- jsdoc.vim
" https://github.com/heavenshell/vim-jsdoc
Plugin 'heavenshell/vim-jsdoc'

"--- nerdcommenter
" https://github.com/scrooloose/nerdcommenter
Plugin 'scrooloose/nerdcommenter'

"--- Gained and FocusLost autocommand events are not working in terminal vim
" Wait for https://github.com/neovim/neovim/pull/3488
Plugin 'tmux-plugins/vim-tmux-focus-events'

"--- UltiSnips
" https://github.com/SirVer/ultisnips
Plugin 'SirVer/ultisnips'

"--- SnipMate
" https://github.com/honza/vim-snippets
Plugin 'honza/vim-snippets'

"--- End initialize
call vundle#end()
filetype plugin indent on
"------------------------------------------------
" /INCLUDE PLUGINS
"------------------------------------------------


"------------------------------------------------
" /PLUGIN SETTINGS
"------------------------------------------------

"--- The NERD Tree
source ~/.config/nvim/config/nerdtree.vim
"--- vim-airline
source ~/.config/nvim/config/vim-airline.vim
"--- syntastic
source ~/.config/nvim/config/syntastic.vim
"--- vim-session
source ~/.config/nvim/config/vim-session.vim
"--- emmet-vim
source ~/.config/nvim/config/emmet-vim.vim
"--- jsdoc.vim
source ~/.config/nvim/config/jsdoc.vim
"--- nerdcommenter
source ~/.config/nvim/config/nerdcommenter.vim
"--- ultisnips
source ~/.config/nvim/config/ultisnips.vim

"------------------------------------------------
" /PLUGIN SETTINGS
"------------------------------------------------


"------------------------------------------------
" ABBRS
"------------------------------------------------
"------------------------------------------------
" /ABBRS
"------------------------------------------------

