set nocompatible

if (has('nvim'))
  call plug#begin('~/.local/share/nvim/plugged')
else
  call plug#begin('~/.vim/plugged')
endif

if (has('nvim'))
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } 
  Plug 'ervandew/supertab'
endif
  
Plug 'honza/vim-snippets'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'

" JavaScript
  
Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'pangloss/vim-javascript'
Plug 'othree/es.next.syntax.vim'
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'jason0x43/vim-js-indent'

" CSS
Plug 'hail2u/vim-css3-syntax'
Plug 'cakebaker/scss-syntax.vim'

" HTML
Plug 'mattn/emmet-vim'

call plug#end()

syntax enable

" Lines
set number

if (v:version > 700)
  set relativenumber
endif

set cursorline

" Normal backspace
set backspace=indent,eol,start

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Indentation
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2


"JS specific stuff

if (has('nvim'))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

colorscheme onedark


