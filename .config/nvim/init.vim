set nocompatible

call plug#begin('~/.config/nvim/plugged')

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vimwiki/vimwiki'
Plug 'w0rp/ale'
Plug 'jacoborus/tender.vim'

" JavaScript
Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'pangloss/vim-javascript'
Plug 'othree/es.next.syntax.vim'
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'jason0x43/vim-js-indent'
Plug 'elzr/vim-json'

" Ruby
Plug 'vim-ruby/vim-ruby', { 'for': ['ruby', 'haml', 'eruby'] }
Plug 'tpope/vim-rake', { 'for': 'ruby' }
Plug 'tpope/vim-surround'
Plug 'tpope/vim-rails', { 'for': ['ruby', 'eruby', 'haml', 'coffee', 'javascript'] }
Plug 'tpope/vim-rbenv', { 'for': 'ruby' }
Plug 'tpope/vim-bundler', { 'for': 'ruby' }
Plug 'Keithbsmiley/rspec.vim', { 'for': 'ruby' }
Plug 'thoughtbot/vim-rspec', { 'for': 'ruby' }

" CSS
Plug 'hail2u/vim-css3-syntax'
Plug 'cakebaker/scss-syntax.vim'

" Rust
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'

call plug#end()

syntax enable

set number
set relativenumber
set cursorline
set title
set ruler
set list
set hidden

set backspace=indent,eol,start
set autoread
set encoding=utf-8

set t_Co=256

set hlsearch
set ignorecase
set smartcase
set incsearch
set visualbell
set updatetime=100
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set smartindent

:tnoremap <Esc> <C-\><C-n>

" LEADER
let mapleader = ','

if has('mouse')
  set mouse=a
endif

colorscheme tender
set background=dark

let g:airline_theme='tender'

if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
  set termguicolors
endif

map <leader>bg :let &background = (&background == "dark" ? "light" : "dark")<cr>
map <leader>c :nohlsearch<cr>
map <leader>so :so ~/.config/nvim/init.vim<cr>

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Fix some common typos

cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

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

" Improved indent

vnoremap < <gv
vnoremap > >gv

" Terminal

nnoremap z :terminal<cr>
tnoremap <Leader>e <C-\><C-n>

"-------------------------
" PLUGIN: Airline
" ------------------------
" Enable top tabline.
let g:airline#extensions#tabline#enabled = 1

" Disable showing tabs in the tabline. This will ensure that the buffers are
" what is shown in the tabline at all times.
let g:airline#extensions#tabline#show_tabs = 0

" Enable powerline fonts.
let g:airline_powerline_fonts = 1

"-------------------------
" PLUGIN: Ale
" ------------------------

let g:ale_fixers = {
 \ '*': ['remove_trailing_lines', 'trim_whitespace'],
 \ 'javascript': ['eslint'],
 \}

let g:ale_fix_on_save = 1

"-------------------------
" PLUGIN: FZF
" ------------------------

let g:fzf_layout = { 'down': '~25%' }
let g:ctrlp_map = ''
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'

nnoremap <leader>ff :Files<cr>
nnoremap <leader>fi :Ag<cr>

"-------------------------
" PLUGIN: NERDTree
" ------------------------

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

" Files to ignore
let NERDTreeIgnore = [
    \ '^\.DS_Store$',
    \ '^node_modules$',
\]


nnoremap <leader>nf :call NERDTreeToggleInCurDir()<cr>
nnoremap <leader>t :NERDTreeToggle<cr>

"-------------------------
" PLUGIN: Supertab
" ------------------------

let g:SuperTabDefaultCompletionType = '<C-n>'
let g:SuperTabCrMapping = 0

"-------------------------
" PLUGIN: UltiSnips
" ------------------------

let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<c-z>"
let g:UltiSnipsSnippetsDir = "~/.config/nvim/UltiSnips"
let g:UltiSnipsEditSplit = "vertical"
let g:UltiSnipsUsePythonVersion = 3

"-------------------------
" PLUGIN: Vimwiki
" ------------------------

let g:vimwiki_list = [{
        \ 'path': '~/Dropbox/my-wiki',
        \ 'syntax': 'markdown',
        \ 'ext': '.md'}]

au FileType vimwiki set expandtab
au FileType vimwiki set shiftwidth=2
au FileType vimwiki set softtabstop=2
au FileType vimwiki set tabstop=2

"-------------------------
" PLUGIN: Goyo
" ------------------------

let g:goyo_width = 120

"-------------------------
" LANGUAGE: Rust
" ------------------------

let g:rustfmt_autosave = 1

au FileType rust set expandtab
au FileType rust set shiftwidth=4
au FileType rust set softtabstop=4
au FileType rust set tabstop=4

"-------------------------
" LANGUAGE: Javascript
" ------------------------

au FileType javascript set expandtab
au FileType javascript set shiftwidth=2
au FileType javascript set softtabstop=2
au FileType javascript set tabstop=2

"-------------------------
" LANGUAGE: Ruby
" ------------------------

au FileType ruby set expandtab
au FileType ruby set shiftwidth=2
au FileType ruby set softtabstop=2
au FileType ruby set tabstop=2

"-------------------------
" LANGUAGE: JSON
" ------------------------

au FileType json set expandtab
au FileType json set shiftwidth=2
au FileType json set softtabstop=2
au FileType json set tabstop=2

"-------------------------
" LANGUAGE: Vimscript
" ------------------------

au FileType vim set expandtab
au FileType vim set shiftwidth=4
au FileType vim set softtabstop=4
au FileType vim set tabstop=4

"-------------------------
" LANGUAGE: Bash
" ------------------------

au FileType sh set noexpandtab
au FileType sh set shiftwidth=2
au FileType sh set softtabstop=2
au FileType sh set tabstop=2
