let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
" Powerline
set rtp+=/usr/share/powerline/bindings/vim/

" Always show statusline
set laststatus=2
" Use 256 colours (Use this setting only if your terminal supports 256  colours)
set t_Co=256
let g:Powerline_symbols = "fancy"

call plug#begin('~/.vim/plugged')
  Plug 'morhetz/gruvbox'
  Plug 'dense-analysis/ale'
  Plug 'puremourning/vimspector'
  Plug 'preservim/nerdtree'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'jistr/vim-nerdtree-tabs'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

syntax on
set background=dark
colorscheme gruvbox


au BufNewFile,BufRead *.py
     \ set expandtab |
     \ set autoindent |    
     \ set tabstop=4 |
     \ set softtabstop=4 |
     \ set shiftwidth=4 |

au BufNewFile,BufRead *.yml,*.yaml,*.js,*.html,*json
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
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
" use <c-space>for trigger completion
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

nmap <F10> :ALEFix<CR>
nnoremap <space> za
nnoremap <C-n> :NERDTreeToggle<CR>
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

nnoremap <C-p> :Files<CR>

set hlsearch

let g:vimspector_enable_mappings = 'HUMAN'
let g:vimspector_bottombar_height = 20
