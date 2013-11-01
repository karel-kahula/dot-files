" general
set autoread

" ui
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Configure backspace so it acts as it should act
set backspace=eol,start,indent

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" line numbers
set number
set ruler

" search
set hlsearch
set incsearch
set ignorecase

" soft-tabs
set expandtab
set tabstop=2
set smarttab
set shiftwidth=2
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

"""""""""""""""""""""""""""""
" Colors and Fonts
"""""""""""""""""""""""""""""
" Set extra options when running in GUI mode
if has("gui_running")
  set guioptions-=T
  set guioptions+=e
  set t_Co=256
  set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

"""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" Remember info about open buffers on close
set viminfo^=%

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line (http://got-ravings.blogspot.ca/2008/08/vim-pr0n-making-statuslines-that-own.html)
set statusline=%t       "tail of the filename
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file

""""""""""""""""""""""""""""""
" => Helper Functions
""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

""""""""""""""""""""""""""""""
" => Hotkeys
""""""""""""""""""""""""""""""

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>
