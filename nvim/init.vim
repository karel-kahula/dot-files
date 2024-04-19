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


Plug 'ayu-theme/ayu-vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'felixfbecker/php-language-server', {'do': 'composer install && composer run-script parse-stubs'}
Plug 'neovim/nvim-lspconfig'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'fgsch/vim-varnish'
Plug 'tpope/vim-obsession'
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
Plug 'nelsyeung/twig.vim'

call plug#end()

" UI 
""""""""""""""""""""""""""""""
"Always show current position
set ruler

" line numbers
set number
set ruler
set colorcolumn=80

" search
set hlsearch
set incsearch
set smartcase
set ignorecase

" tab settings
set smarttab
set shiftround
set expandtab
set tabstop=2
set shiftwidth=2

" intendation
set autoindent
set cindent
set cinkeys-=0#
set indentkeys-=0#

" clip board
set clipboard=unnamed

" wrapping
set wrap

" no swap files
set noswapfile
set nobackup
set nowritebackup

syntax on

" make highlighting look better
hi Visual term=reverse cterm=reverse

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" omnicomplete
let g:omni_sql_no_default_maps = 1

" disable mouse
set mouse=

" => Theme
""""""""""""""""""""""""""""""
let ayucolor="light" 
set background=light
" colorscheme defaut

" => Hotkeys
""""""""""""""""""""""""""""""
" redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>
nmap <leader>r :source $HOME/.config/nvim/init.vim<CR>
nmap <leader>n :cnext<CR>
nmap <leader>p :cprev<CR>

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

" => LSP
""""""""""""""""""""""""""""""
lua require'lspconfig'.gopls.setup{}
lua require'lspconfig'.intelephense.setup{}
lua require'lspconfig'.bashls.setup{}
lua require'lspconfig'.tsserver.setup{}
lua require'lspconfig'.pylsp.setup{}

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
autocmd BufWritePre (InsertLeave?) <buffer> lua vim.lsp.buf.formatting_sync(nil,500)

" more natural escape press for exiting insert mode while in terminal
tnoremap <Esc> <C-\><C-n>
