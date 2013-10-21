" line numbers
set number
set ruler

" search
set hlsearch
set incsearch
set ignorecase

" soft-tabs
set expandtab
set tabstop=4
set smarttab
set shiftwidth=4
set shiftround

" intendation
set autoindent
set smartindent

" navigation
set whichwrap+=<,>,h,l,[,] "move to next line by moving cursor to EOL

" mouse support
set mouse=a
set ttymouse=xterm2

" clip board
set clipboard=unnamed

" persistent undo
if version >= 703
    set undodir=~/.vim/tmp/undo/
    set undofile
    set undolevels=1000
    set undoreload=10000
endif

" theming
syntax enable
set background=dark
colorscheme solarized
