"au FileType gitcommit set tw=72
" Vundle
set nocompatible                " required. vim >> vi.
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
"filetype plugin indent on       " required / or is it? https://stackoverflow.com/questions/28310094/is-it-possible-to-include-multiple-file-types-when-using-the-filetype-event
"filetype on
filetype plugin on

" Source configuration
source ~/.vim/rc/indent
source ~/.vim/rc/simpylfold
source ~/.vim/rc/syntastic
source ~/.vim/rc/youcompleteme
source ~/.vim/rc/nerdtree
source ~/.vim/rc/solarized

" Other configuration
"let python_highlight_all=1
set encoding=utf-8
syntax on
set nonu
au FileType gitcommit set tw=72

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

" Toggle spellchecking
nnoremap <leader>s :set spell!<CR>:setl spell?<CR>

" Enable folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" Set maximum line length
au FileType markdown,readme,text setl tw=79

" Highlight trailing whitespace
hi ExtraWhitespace ctermbg=red guibg=red
au ColorScheme * hi ExtraWhitespace guibg=red
au BufEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/
":highlight ExtraWhitespace ctermbg=red guibg=red
":match ExtraWhitespace /\s\+\%#\@<!$/
":autocmd InsertLeave * redraw!

" Split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Break the habit
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Enter paste mode when pressing F3 (no indent)
set pastetoggle=<F3>

" Clear terminal before execution commands
set shell=~/.vim/shell_wrapper.sh
