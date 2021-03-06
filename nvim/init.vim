filetype plugin indent on
set autoread
let mapleader=","

" => Python Config
""""""""""""""""""""""""""""""
let g:python3_host_prog = '/usr/bin/python3'
let g:loaded_python_provider = 0

" => Plug-ins
""""""""""""""""""""""""""""""
call plug#begin()


" Plug 'dracula/vim', { 'as': 'dracula' }
" Plug 'overcache/NeoSolarized'
" Plug 'chriskempson/base16-vim'
Plug 'ayu-theme/ayu-vim'
Plug 'editorconfig/editorconfig-vimhttps://github.com/'
Plug 'felixfbecker/php-language-server', {'do': 'composer install && composer run-script parse-stubs'}
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'neovim/nvim-lspconfig'
Plug 'pangloss/vim-javascript'
Plug 'prettier/vim-prettier', { 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'fgsch/vim-varnish'

call plug#end()

" UI 
""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Configure backspace so it acts as it should act
set backspace=eol,start,indent

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

"Always show current position
set ruler

" line numbers
set number
set ruler

" search
set hlsearch
set incsearch
set smartcase
set ignorecase

" tab settings
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

" no swap files
set noswapfile
set nobackup
set nowritebackup

" theming
syntax off
set background=dark

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" omnicomplete
let g:omni_sql_no_default_maps = 1

" FZF 
""""""""""""""""""""""""""""""
nnoremap <C-p> :<C-u>FZF<CR>


" => Hotkeys
""""""""""""""""""""""""""""""
" redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>
nmap <leader>r :source $HOME/.config/nvim/init.vim<CR>
nmap <leader>n :cnext<CR>
nmap <leader>p :cprev<CR>

" => Theme
""""""""""""""""""""""""""""""
let g:dracula_italic = 0
set termguicolors
set background=light
let ayucolor="light" 
colorscheme ayu
highlight Normal ctermbg=None

" => fzf
""""""""""""""""""""""""""""""
nnoremap <C-p> :<C-u>FZF<CR>
let g:fzf_history_dir = '~/.local/share/fzf-history'

" => editor-config
""""""""""""""""""""""""""""""
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" => vim-go
""""""""""""""""""""""""""""""
let $PATH = $HOME."/dev:".$PATH
let $GOPATH = $HOME."/go"
let g:go_bin_path = $HOME."/go/bin"
let g:go_auto_type_info = 1
let g:go_fmt_command = 'goimports'
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

" => vim-go
""""""""""""""""""""""""""""""
let g:go_fmt_command = "goimports"

" => LSP
""""""""""""""""""""""""""""""
lua require'lspconfig'.gopls.setup{}
lua require'lspconfig'.intelephense.setup{}
lua require'lspconfig'.bashls.setup{}
lua require'lspconfig'.tsserver.setup{}

nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gR    <cmd>lua vim.lsp.buf.rename()<CR>

" Use LSP omni-completion
autocmd Filetype python,go setlocal omnifunc=v:lua.vim.lsp.omnifunc

" Auto-format files prior to saving them
autocmd BufWritePre *.go lua vim.lsp.buf.formatting_sync(nil, 1000)

" spellcheck
" set spell
tnoremap <Esc> <C-\><C-n>
