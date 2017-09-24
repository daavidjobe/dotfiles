set nocompatible

call plug#begin('~/.local/share/nvim/plugged')
  
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'ervandew/supertab'
  Plug 'honza/vim-snippets'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'scrooloose/nerdtree'
  Plug 'joshdick/onedark.vim'
  Plug 'vim-airline/vim-airline'

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

"Lines"
set number
set relativenumber
set cursorline

"Normal backspace"
set backspace=indent,eol,start

"Show file stats"
set ruler

"Blink cursor on error instead of beeping (grr)"
set visualbell

"Indentatio"
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2


if (has('nvim'))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

colorscheme onedark






