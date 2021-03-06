set nocompatible

call plug#begin('~/.config/nvim/plugged')

Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'jparise/vim-graphql'

Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'

Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vimwiki/vimwiki'

Plug 'w0rp/ale'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'sebastianmarkow/deoplete-rust'

" JavaScript
Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'pangloss/vim-javascript'
Plug 'othree/es.next.syntax.vim'
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'jason0x43/vim-js-indent'
Plug 'elzr/vim-json'
Plug 'posva/vim-vue'

" CSS
Plug 'hail2u/vim-css3-syntax'
Plug 'cakebaker/scss-syntax.vim'

" Rust
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'

" Ruby
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'tpope/vim-rails'

let g:gruvbox_contrast_light = 'hard'
let g:gruvbox_contrast_dark = 'hard'

call plug#end()

syntax enable

set number
set relativenumber
set cursorline
set title
set ruler
set list
set hidden
set signcolumn=yes

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

" Permanent undo
set undodir=~/.vimdid
set undofile

:tnoremap <Esc> <C-\><C-n>

let mapleader = ','

if has('mouse')
  set mouse=a
endif

colorscheme gruvbox
set background=dark
let base16colorspace=256

let g:airline_theme='gruvbox'

if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
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


" <leader><leader> toggles between buffers
nnoremap <leader><leader> <c-^>


"-------------------------
" PLUGIN: Deoplete
" ------------------------

call deoplete#custom#source('_',
    \ 'disabled_syntaxes', ['Comment', 'String'])

let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#rust#racer_binary = '$HOME/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path = '$RUST_SRC_PATH'


"-------------------------
" PLUGIN: Airline
" ------------------------

" Enable powerline fonts.
let g:airline_powerline_fonts = 1

"-------------------------
" PLUGIN: Ale
" ------------------------

let g:ale_fixers = {
  \ '*': ['remove_trailing_lines', 'trim_whitespace'],
  \ 'javascript': ['eslint'],
  \ 'ruby': ['rubocop'],
  \ 'rust': ['rustfmt']
  \}

let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_save = 1
let g:ale_lint_on_enter = 0
let g:ale_rust_cargo_use_check = 1
"let g:ale_rust_cargo_check_all_targets = 1

"-------------------------
" PLUGIN: FZF
" ------------------------

let g:fzf_layout = { 'down': '~25%' }
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'

if executable('rg')
	set grepprg=rg\ --no-heading\ --vimgrep
	set grepformat=%f:%l:%c:%m
endif


nnoremap <leader>ff :Files<cr>
nnoremap <leader>s :Rg<cr>

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

"-------------------------
" PLUGIN: Vimwiki
" ------------------------

let g:vimwiki_list = [{
        \ 'path': '~/Dropbox/my-wiki',
        \ 'syntax': 'markdown',
        \ 'ext': '.md'}]

"-------------------------
" PLUGIN: Goyo
" ------------------------

let g:goyo_width = 120


"-------------------------
" LANGUAGE: Rust
" ------------------------

nnoremap <leader>rf :RustFmt<cr>
nnoremap <leader>rr :Cargo run<cr>
nnoremap <leader>rt :Cargo test<cr>


au FileType rust set expandtab
au FileType rust set shiftwidth=4
au FileType rust set softtabstop=4
au FileType rust set tabstop=4

"-------------------------
" LANGUAGE: Vimscript
" ------------------------

au FileType vim set expandtab
au FileType vim set shiftwidth=4
au FileType vim set softtabstop=4
au FileType vim set tabstop=4
