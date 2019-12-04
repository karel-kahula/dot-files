" general
filetype plugin indent on
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
set cmdheight=1

" line numbers
set number
set ruler

" search
set hlsearch
set incsearch
set smartcase
set ignorecase

" soft-tabs
set expandtab
set tabstop=4
set smarttab
set shiftwidth=4
set shiftround

" intendation
set autoindent
" set smartindent
set cindent
set cinkeys-=0#
set indentkeys-=0#

" navigation
set whichwrap+=<,>,h,l,[,] "move to next line by moving cursor to EOL

" mouse support
set mouse=a
set ttymouse=xterm2

" clip board
set clipboard=unnamed

" wrapping
set wrap

" persistent undo
if version >= 703
    set undodir=~/.vim/tmp/undo/
    set undofile
    set undolevels=1000
    set undoreload=10000
endif

" no swap files
set noswapfile

" theming
syntax enable
set background=dark

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
set encoding=utf-8
set t_Co=256
set termencoding=utf-8

" Use Unix as the standard file type
set ffs=unix,dos,mac

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
" => Vimdiff
""""""""""""""""""""""""""""""
set diffopt+=iwhite
set diffexpr=""

if &diff
  set background=dark
endif

""""""""""""""""""""""""""""""
" => Minibufexpl
""""""""""""""""""""""""""""""
map <Leader>mbe :MBEOpen<cr>
map <Leader>mbc :MBEClose<cr>
map <Leader>mbt :MBEToggle<cr>

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
" <Ctrl-k> remove trailing whitespace.
nnoremap <silent> <C-k> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

""""""""""""""""""""""""""""""
" => Right margin indicator
""""""""""""""""""""""""""""""
set colorcolumn=0 " turn it off for now...

""""""""""""""""""""""""""""""
" => Hilight trailing whitespace
"""""""""""""""""""""""""""""
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

""""""""""""""""""""""""""""""
" => ALE
""""""""""""""""""""""""""""""
let g:ale_fixers = {
\   'php': ['php_cs_fixer'],
\}
let g:ale_fix_on_save = 1

""""""""""""""""""""""""""""""
" => Airline
""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='dracula'

""""""""""""""""""""""""""""""
" => fzf
""""""""""""""""""""""""""""""
set rtp+=/usr/local/opt/fzf

nnoremap <C-p> :<C-u>FZF<CR>

" This is the default extra key bindings
let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-x': 'split',
    \ 'ctrl-v': 'vsplit' }

" An action can be a reference to a function that processes selected lines
function! s:build_quickfix_list(lines)
    call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
    copen
    cc
endfunction

let g:fzf_action = {
    \ 'ctrl-q': function('s:build_quickfix_list'),
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-x': 'split',
    \ 'ctrl-v': 'vsplit' }

let g:fzf_history_dir = '~/.local/share/fzf-history'

""""""""""""""""""""""""""""""
" => vim-go
""""""""""""""""""""""""""""""
let g:go_gorename_command = 'gopls'

""""""""""""""""""""""""""""""
" => ctags
""""""""""""""""""""""""""""""
set tags=tags

""""""""""""""""""""""""""""""
" => Plugins
""""""""""""""""""""""""""""""
packloadall
silent! helptags ALL

""""""""""""""""""""""""""""""
" => neomake
""""""""""""""""""""""""""""""
call neomake#configure#automake('w')

