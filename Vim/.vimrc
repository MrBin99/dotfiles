set nocompatible
syntax enable                                      " enable syntax processing
set tabstop=4                                      " number of visual spaces per TAB
set softtabstop=4                                  " number of spaces in tab when editing
set expandtab                                      " tabs are spaces
set number                                         " show line numbers
set relativenumber                                 " show relative line numbers
set lazyredraw                                     " redraw only when we need to.
set showmatch                                      " highlight matching [{()}]
set incsearch                                      " search as characters are entered
set hlsearch                                       " highlight matches

call plug#begin('~/.vim/plugged')

Plug 'dag/vim-fish'

call plug#end()
