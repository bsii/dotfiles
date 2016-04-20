set nocompatible              " be iMproved, required
filetype off                  " required
set encoding=utf-8
set t_Co=256

set clipboard=unnamed
let mapleader = ","

" https://blog.hanschen.org/2012/10/24/different-background-color-in-vim-past-80-columns/
highlight ColorColumn ctermbg=235 guibg=234
let &colorcolumn=join(range(142,333),",")



" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
	Plugin 'VundleVim/Vundle.vim'

	Plugin 'scrooloose/NERDTree'
	Plugin 'jlanzarotta/bufexplorer'
	Plugin 'YankRing.vim'
	Plugin 'Gundo'

	Plugin 'command-t'
	Plugin 'kien/ctrlp.vim'
	Plugin 'emacscommandline'

	Plugin 'rizzatti/dash.vim'
	Plugin 'EasyMotion'
	Plugin 'xterm-color-table.vim'

	Plugin 'tpope/vim-fugitive'
	Plugin 'powerline/powerline'
	Plugin 'L9'

	Plugin 'scratch.vim'
	
" All of your Plugins must be added before the following line
call vundle#end()            " required


filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on


syntax on
filetype on

au BufNewFile,BufRead *.js set filetype=javascript
au BufNewFile,BufRead *.json set filetype=javascript
au BufRead,BufNewFile *.zshrc set filetype=zsh

set wildchar=<Tab> 
set wildmenu 
set wildmode=longest,full

set rtp+=/usr/local/lib/python2.7/site-packages/powerline/powerline/bindings/vim

let g:miniBufExplForceSyntaxEnable = 1
let g:minBufExplForceSyntaxEnable = 1
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
 
if ! has('gui_running')
   set ttimeoutlen=10
   augroup FastEscape
      autocmd!
      au InsertEnter * set timeoutlen=0
      au InsertLeave * set timeoutlen=1000
   augroup END
endif
 
set fillchars+=stl:\ ,stlnc:\
set laststatus=2 " Always display the statusline in all windows
set guifont=Sauce\ Code\ Powerline:h20
" set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)


set ruler
set incsearch
set hlsearch
set ignorecase              " case insensitive search
set smartcase               "if any capitol in search, turns search case sensitive
set history=1000             "Remember 1000 lines of history, for commands and searches
set showmatch                " jump to match bracket on insertion
set background=dark

:if has('syntax')
    syntax on
:endif



nnoremap <F5> :GundoToggle<CR>
