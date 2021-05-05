" Vundle
set nocompatible                " be iMproved, required
filetype off                    " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

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
