" ---------------------------------------------------------------------------- "
"                       MrBin99 - Vim configuration file                       "
" ---------------------------------------------------------------------------- "

set nocompatible                       " Disable compatibility mode with 'Vi'

set background=dark                    " Set background to dark

filetype on                            " Enable filetype detection
filetype plugin on                     " Enable filetype-specific plugins
filetype indent off                    " Disable filetype-specific indenting
syntax on                              " Enable syntax highlighting

set number                             " Show line numbers
set relativenumber                     " Show relative line numbers
set showcmd                            " Show command in status line
set showmatch                          " Show matching brackets
set colorcolumn=80                     " Highlight column 80
set cursorline                         " Highlight current line

set ignorecase                         " Ignore case when searching
set smartcase                          " Ignore case when searching with capital letters
set incsearch                          " Incremental search
set hlsearch                           " Highlight search results
nnoremap <CR> :noh<CR><CR>:<backspace> " Clear search results with Enter

set fileformats=unix                   " Set file formats to Unix
set encoding=utf-8                     " Set encoding to UTF-8

set tabstop=2                          " Set tab size to 2 spaces
set softtabstop=2                      " Set soft tab size to 2 spaces
set shiftwidth=2                       " Set shift width to 2 spaces
set autoindent                         " Enable auto-indentation
set smartindent                        " Enable smart indentation
set expandtab                          " Use spaces instead of tabs

au BufNewFile,BufRead *.py,*.php,*.html,*.rs            " Set custom indent
  \ set tabstop=4 |
  \ set softtabstop=4 |
  \ set shiftwidth=4 |

hi cursorline term=bold cterm=bold ctermbg=18       " Highlight current line
hi cursorlinenr term=bold cterm=bold ctermbg=18     " Highlight current line number
hi colorcolumn term=bold cterm=bold ctermbg=18      " Highlight column 80
