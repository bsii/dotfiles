set nocompatible              " be iMproved, required
filetype off                  " required
set t_Co=256

set clipboard=unnamed
let mapleader = ","

" https://blog.hanschen.org/2012/10/24/different-background-color-in-vim-past-80-columns/
highlight ColorColumn ctermbg=235 guibg=234
let &colorcolumn=join(range(142,333),",")

