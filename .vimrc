set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'pangloss/vim-javascript'
Plugin 'elzr/vim-json'
Bundle 'Valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on

" autocompletion window goes away after using
let g:ycm_autoclose_preview_window_after_completion=1

" goto definiction
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" folding code
set foldmethod=indent
set foldlevel=99
" folding shortcut
nnoremap <space> za

" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab" python PEP8 indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
" fullstack
au BufNewFile,BufRead *.js,*.html,*.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
" whitespace showing
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h,*.js match BadWhitespace /\s\+$/

set encoding=utf-8

let python_highlight_all=1
let g:syntastic_check_on_open = 1
let g:syntastic_python_checkers = ['pep8']
let g:syntastic_javascript_checkers = ['eslint']
syntax on

set hlsearch
set laststatus=2
set t_Co=256
vnoremap // y/<C-R>"<CR>
set rtp+=~/.vim/bundle/YouCompleteMe

