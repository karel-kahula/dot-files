" general
filetype plugin indent on
set autoread
let mapleader=","

" ui
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Configure backspace so it acts as it should act
set backspace=eol,start,indent

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
set cindent
set cinkeys-=0#
set indentkeys-=0#

" navigation
set whichwrap+=<,>,h,l,[,] "move to next line by moving cursor to EOL

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

" => Hotkeys
""""""""""""""""""""""""""""""
" redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>
" remove trailing whitespace.
nnoremap <silent> <C-k> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" cnext and cprev
nmap <leader>n :cnext<CR>
nmap <leader>p :cprev<CR>

nmap <leader>r :source $HOME/.vimrc<CR>

" => Hilight trailing whitespace
"""""""""""""""""""""""""""""
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()


" => Plugins
"""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'editorconfig/editorconfig-vim'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'govim/govim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

" => Theme
""""""""""""""""""""""""""""""
let g:dracula_italic = 0
colorscheme dracula
highlight Normal ctermbg=None

" => fzf
""""""""""""""""""""""""""""""
nnoremap <C-p> :<C-u>FZF<CR>
let g:fzf_history_dir = '~/.local/share/fzf-history'

" => editor-config
""""""""""""""""""""""""""""""
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" => govim
""""""""""""""""""""""""""""""
set updatetime=500
set signcolumn=number


" => vim-go
""""""""""""""""""""""""""""""
let $PATH = $HOME."/dev:".$PATH
let $GOPATH = $HOME."/go"
let g:go_bin_path = $HOME."/go/bin"
let g:go_auto_type_info = 1
let g:go_fmt_command = 'goimports'
let g:go_gorename_command = 'gopls'
let g:go_highlight_build_constraints = 1
let g:go_highlight_build_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_functions = 1
let g:go_highlight_types = 1
let g:go_textobj_include_function_doc = 0

" => Airline
""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='violet'
let g:airline#extensions#ale#enabled = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_symbols.crypt =''
let g:airline_symbols.dirty='⚠'

