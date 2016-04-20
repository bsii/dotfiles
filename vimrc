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

" toggle (invert) the current paste state and show new state
"" http://of-vim-and-vigor.blogspot.com/2012/01/one-key-to-toggle-them-all.html
function! PasteToggle()
	set invpaste
	set paste?
endfunction

" gundo
nnoremap <F5> :GundoToggle<CR>

" paste toggles
" TODO find a better mapping?
nnoremap <F9> :call PasteToggle()<CR>
vnoremap <F9> :<c-u>call PasteToggle()<CR>gv
set pastetoggle=<F9>




""" OLD settings from dh/rc cvs, being reevaluated as of 2016-04-20 14:54
"
" set cb=exclude:.*
" 
" :nmap <silent> gw "_yiw:s/\(\%#\w\+\)\(\W\+\)\(\w\+\)/\3\2\1/<cr><c-o><c-l>
" 
" :if has('autocmd')
" :endif
" 

" 
" set autoindent               " copy indent from current line when starting a new line
" set backspace=2                     " allow backspacing over autoindent, line breaks, and start of insert
" set smarttab                 " make TAB and BS create and remove appropriate number of spaces
" set tabstop=4
" set expandtab                " use appropriate number of spaces in place of a tab.  use C-v<tab> for a real tab
" set sw=4                     " shiftwidth 4 spaces for each step of (auto)indent
" set formatoptions=cqtb       " c = autowrap comments with textwidth
"                              " q = allow formatting of comments with gq
"                              " t = auto-wrap text using text-width
"                              " b = autowrap in insert if insertion start point < textwdith
" 
" :if has('autocmd')
"     autocmd BufEnter *mutt-*-*,/tmp/pico.* source ~/loco/lib/vim/mail.vimrc
" 
"     " set filetype for mason files
"     autocmd BufNewFile,BufRead *.m,*.mi,*.mhtml set filetype=mason
" 
"     " set formatoptions for the following file types
"     autocmd FileType perl,c,mason set formatoptions=crql nowrap tabstop=2 shiftwidth=2
"     autocmd FileType perl,c,mason set textwidth=120
" 
"     " turn on this filetype stuff
"     filetype plugin indent on
" 
"     " macros for mason 
"     autocmd FileType mason nmap @p I<%perl><CR></%perl><CR><ESC>kO
"     autocmd FileType mason nmap @a I<%args><CR></%args><CR><ESC>kO
"     autocmd FileType mason nmap @d I<%doc><CR></%doc><CR><ESC>kO
"     autocmd FileType mason nmap @% a<%   %><ESC>3hi
" 
"     autocmd FileType perl,c,mason set cindent                                 " cin:  Use C-indenting
"     autocmd FileType perl,c,mason set cinkeys=0{,0},!^F,o,O,e                 " cink:  Perl-friendly reindent keys
"     autocmd FileType perl,c,mason set cinoptions=t0,+4,(0,)60,u0,*100         " cino:  all sorts of options
"     autocmd FileType perl,c,mason set cinwords=if,else,while,do,for,elsif,sub
"     autocmd FileType perl,c,mason set comments=n:#                            " com:  Perlish comments
" 
"     " set nosmartindent  " nosi:  Smart indent useless when C-indent is on
" :endif
" 
" let spell_auto_type="tex,doc,mail" "Turn on auto-spell for these file types
" 
"   "map ctrl-e to edit file in perforce
"   nmap <C-E> :!p4 edit %<CR>
"   
"   "map ctrl-c to chmod +w current file
"   nmap <C-C> :!chmod +w  %<CR>
" 
"   "map F1 to paste in the selection buffer (*)
"   nmap <F1> "*p
" 
"   "Add Align map for =
"   nmap ga :Align =<CR>
" 
" "Visual Mode Maps
"   "Visual mode comment adding
"   vmap <C-C> :s/^/#/g<enter>  " control-c comments block
"   vmap <C-X> :s/^#//g<enter>  " control-x uncomments block
"   vmap <C-A> :Align =<enter>  " Align =  in block
"   vmap <C-H> :Align =><enter> " Align => in block
" 
" "Insert Mode Maps
"   "map ctrl-a and ctrl-e to act like emacs
"   imap <C-A> <C-O>^
"   imap <C-E> <C-O>$
" 
" "Commands for perforce, from Scott Windsor
"   " Perforce commands
"   command -nargs=0 Diff :!p4 diff %
"   command -nargs=0 Changes :!p4 changes %
"   command -nargs=1 Describe :!p4 describe <args> | more
"   command -nargs=0 Edit :!p4 edit %
"   command -nargs=0 Revert :!p4 revert %
" 
" set completeopt=menuone,preview
"
"
