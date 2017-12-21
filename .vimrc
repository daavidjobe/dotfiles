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

" JavaScript
  
Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'pangloss/vim-javascript'
Plug 'othree/es.next.syntax.vim'
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'jason0x43/vim-js-indent'
Plug 'w0rp/ale'
Plug 'elzr/vim-json'

" Elm
Plug 'elmcast/elm-vim'


" CSS

Plug 'hail2u/vim-css3-syntax'
Plug 'cakebaker/scss-syntax.vim'

" HTML

Plug 'mattn/emmet-vim'

" Rust

Plug 'rust-lang/rust.vim'
Plug 'sebastianmarkow/deoplete-rust'
Plug 'racer-rust/vim-racer'

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


" Leader
 let mapleader = ';'

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

colorscheme onedark

" Use deoplete.

let g:deoplete#enable_at_startup = 1

" Linting

let g:ale_fixers = {
 \  'javascript': ['eslint'],
 \}

let g:ale_fix_on_save = 1

" NERDTree

let NERDTreeShowHidden = 1

function! NERDTreeToggleInCurDir()
  if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
    exe ":NERDTreeClose"
  else
    if (expand("%:t") != '')
      exe ":NERDTreeFind"
    else
      exe ":NERDTreeToggle"
    endif
  endif
endfunction

nnoremap <leader>nf :call NERDTreeToggleInCurDir()<cr>
nnoremap <leader>t :NERDTreeToggle<cr>

" Searching

if (executable('fzf'))
  nnoremap <leader>ff :Ag<cr>
  let g:fzf_layout = { 'down': '~20%' }
  let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
else
  nnoremap <leader>ff :CtrlP<space>
endif

" Disctraction free coding

let g:goyo_width = 120

" Rust

let g:rustfmt_autosave = 1

let g:deoplete#sources#rust#racer_binary = '/Users/david/.cargo/bin/racer' 
let g:deoplete#sources#rust#rust_source_path = '/Users/david/Projects/rust/src'
let g:deoplete#sources#rust#show_duplicates = 1
let g:deoplete#sources#rust#documentation_max_height = 20

" Visual

vnoremap < <gv
vnoremap > >gv

