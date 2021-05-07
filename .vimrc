" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin(stdpath('data') . '/plugged')

" Plugins
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ctrlpvim/ctrlp.vim'

" Initialize plugin system
call plug#end()

" Other
au FileType gitcommit set tw=72
set encoding=utf-8
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
source ~/.vim/rc/indent

" Maintain undo history between sessions
set undofile
set undodir=~/.vim/undo/
set undolevels=10000
set history=1000

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Highlight trailing whitespace
hi ExtraWhitespace ctermbg=red guibg=red
au ColorScheme * hi ExtraWhitespace guibg=red
au BufEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/

" Enable folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" Enter paste mode when pressing F3 (no indent)
set pastetoggle=<F3>

" Clear terminal before execution commands
set shell=~/.vim/shell_wrapper.sh

" Colors
set background=dark
colorscheme solarized
let g:airline_theme='solarized_flood'

" Enable number toggle and set color for current line number
set number relativenumber
highlight CursorLineNR cterm=bold ctermfg=Grey ctermbg=none

" Disable python2, ruby, and nodejs
let g:loaded_python_provider=0
let g:loaded_ruby_provider=0
let g:loaded_node_provider=0

" Toggle line numbers with ctrl-n
nnoremap <C-n> :set number! relativenumber!<CR>

" Synchronize clipboard with default register
set clipboard^=unnamed
