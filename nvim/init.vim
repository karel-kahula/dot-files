filetype plugin indent on
set autoread
let mapleader=","

" => Python Config
""""""""""""""""""""""""""""""
" No python-based plugins in use, so skip the remote-plugin providers entirely.
" Avoids a pynvim/host-prog mismatch (shell uses pyenv, not /usr/bin/python3)
" and the related :checkhealth warning. Editing Python files / pylsp is
" unaffected — that runs as an external LSP binary via mason.
let g:loaded_python_provider = 0
let g:loaded_python3_provider = 0

" => Plug-ins
""""""""""""""""""""""""""""""
call plug#begin()


Plug 'ayu-theme/ayu-vim'
Plug 'folke/tokyonight.nvim'
Plug 'editorconfig/editorconfig-vim'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'fgsch/vim-varnish'
Plug 'folke/persistence.nvim'
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
Plug 'nelsyeung/twig.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'hat0uma/csvview.nvim'

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
set termguicolors
set background=dark
" matches Ghostty's `theme = TokyoNight Storm`
" silent! so a fresh checkout (before :PlugInstall) doesn't error on startup
silent! colorscheme tokyonight-storm
" previous theme: let ayucolor="dark" | colorscheme ayu

" => Session management
""""""""""""""""""""""""""""""
" persistence.nvim auto-saves a session (keyed by cwd, stored under nvim's
" data dir — nothing dropped into the project directory) on every exit.
" Restoring is not automatic on its own, so we do it on a bare `nvim` launch.
lua << EOF
require('persistence').setup()

vim.api.nvim_create_autocmd('VimEnter', {
  group = vim.api.nvim_create_augroup('restore_session', { clear = true }),
  nested = true,
  callback = function()
    if vim.fn.argc() == 0 then
      require('persistence').load()
    end
  end,
})
EOF

" manual fallback for when nvim was opened with file args (auto-restore skips
" that case) — restores the last session for the cwd / the last one overall
nnoremap <leader>qs <cmd>lua require('persistence').load()<CR>
nnoremap <leader>ql <cmd>lua require('persistence').load({ last = true })<CR>

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

" => fzf
""""""""""""""""""""""""""""""
" fuzzy find files (respects .gitignore in a repo via :GFiles)
nnoremap <C-p>      :Files<CR>
nnoremap <leader>b  :Buffers<CR>
" fuzzy content search (needs ripgrep: brew install ripgrep)
nnoremap <leader>f  :Rg<CR>

" => csv
""""""""""""""""""""""""""""""
" csvview.nvim: aligned-column display for CSV/TSV. Uses its own parser (no
" treesitter dependency). Off by default; toggle per-buffer.
lua << EOF
require('csvview').setup({
  view = { display_mode = 'border' },
})
EOF
nnoremap <leader>cv <cmd>CsvViewToggle<CR>

" => LSP
""""""""""""""""""""""""""""""
lua << EOF
-- mason installs/manages the language-server binaries; mason-lspconfig installs
-- anything in ensure_installed and auto-enables it (v2.x + nvim 0.11). That's
-- the whole setup. Fixes the "cmd not executable" errors on buffer open.
require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = { 'gopls', 'bashls', 'ts_ls', 'pylsp' },
})
EOF

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

" Auto-format on save (formatting_sync was removed; use format()). Scoped to
" python/sh — Go is handled by vim-go, JS/TS by vim-prettier.
augroup LspFormatOnSave
  autocmd!
  autocmd FileType python,sh autocmd BufWritePre <buffer> lua vim.lsp.buf.format({ timeout_ms = 500 })
augroup END

" more natural escape press for exiting insert mode while in terminal
tnoremap <Esc> <C-\><C-n>
