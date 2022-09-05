let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
  Plug 'dense-analysis/ale'
  Plug 'puremourning/vimspector'
  Plug 'micha/vim-colors-solarized'
  Plug 'preservim/nerdtree'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'jistr/vim-nerdtree-tabs'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

syntax enable
set background=dark
colorscheme solarized

au BufNewFile,BufRead *.py,*json
     \ set expandtab |
     \ set autoindent |    
     \ set tabstop=4 |
     \ set softtabstop=4 |
     \ set shiftwidth=4 |

au BufNewFile,BufRead *.yml,*.yaml,*.js,*.html
     \ set expandtab |
     \ set autoindent |    
     \ set tabstop=2 |
     \ set softtabstop=2 |
     \ set shiftwidth=2 |

let g:ale_linters = {
      \   'python': ['flake8', 'pylint'],
      \   'ruby': ['standardrb', 'rubocop'],
      \   'javascript': ['eslint'],
      \   'R': ['lintr'],
      \}

let g:ale_fixers = {
      \    'python': ['black'],
      \}
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

nmap <F10> :ALEFix<CR>
nnoremap <space> za
nnoremap <C-n> :NERDTreeToggle<CR>
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

set hlsearch

let g:vimspector_enable_mappings = 'HUMAN'
let g:vimspector_bottombar_height = 20
