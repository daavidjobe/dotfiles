set nocompatible

call plug#begin('~/.local/share/nvim/plugged')

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } 
Plug 'ervandew/supertab'
Plug 'honza/vim-snippets'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'sbdchd/neoformat'

" JavaScript
  
Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'pangloss/vim-javascript'
Plug 'othree/es.next.syntax.vim'
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'jason0x43/vim-js-indent'
Plug 'w0rp/ale'
Plug 'elzr/vim-json'

" CSS

Plug 'hail2u/vim-css3-syntax'
Plug 'cakebaker/scss-syntax.vim'

" HTML

Plug 'mattn/emmet-vim'

call plug#end()

syntax enable

" Lines

set number
set relativenumber
set cursorline

" Normal backspace

set backspace=indent,eol,start

" Show file stats

set ruler

" Search

set hlsearch
set ignorecase
set smartcase
set incsearch

" Blink cursor on error instead of beeping (grr)

set visualbell

" Indentation

set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
:tnoremap <Esc> <C-\><C-n>

" Navigation

nnoremap gj <C-w>j
nnoremap gk <C-w>k
nnoremap gl <C-w>l
nnoremap gh <C-w>h

" movement

nnoremap gJ <C-w>J
nnoremap gK <C-w>K
nnoremap gL <C-w>L
nnoremap gH <C-w>H
nnoremap gR <C-w>R
nnoremap gr <C-w>r

" Panes

nnoremap gn :split<cr>
nnoremap gv :vsplit<cr>

" Colors

colorscheme onedark

" Use deoplete.

let g:deoplete#enable_at_startup = 1

" Linting

let g:ale_fixers = {
 \  'javascript': ['eslint'],
 \}

let g:ale_fix_on_save = 1

" Show hidden files in NERDTree

let NERDTreeShowHidden = 1

" Disctraction free coding

let g:goyo_width = 120

