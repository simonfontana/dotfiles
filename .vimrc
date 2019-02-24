"au FileType gitcommit set tw=72
" Break the habit
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

set encoding=utf-8

" Maintain undo history between sessions
set undofile
set undodir=~/.vim/undo/
set undolevels=10000

" Vundle
set nocompatible                " required
filetype off                    " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Install plugins with PluginInstall
Plugin 'gmarik/Vundle.vim'      " required
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Bundle 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" All of your Plugins must be added before the following line
call vundle#end()               " required
filetype plugin indent on       " required

" Other configuration
let python_highlight_all=1

" Split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Flag bad whitespaces (whitespaces at end of line)
:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+\%#\@<!$/
:autocmd InsertLeave * redraw!

syntax on
set nu

" Enable folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" Source other configuration
source ~/.vim/.indent.vim
source ~/.vim/.simpylfold.vim
source ~/.vim/.youcompleteme.vim
source ~/.vim/.nerdtree.vim

" solarize is awesome
set t_Co=16
syntax enable
let g:solarized_termcolors=16
call togglebg#map("<F5>")
if has('gui_running')
    set background=dark
else
    set background=dark
endif

colorscheme solarized
