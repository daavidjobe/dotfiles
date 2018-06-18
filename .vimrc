set nocompatible

call plug#begin('~/.config/nvim/plugged')

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } 
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'
Plug 'ctrlpvim/ctrlp.vim' " For tag finding in Go
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'rakr/vim-one'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vimwiki/vimwiki'

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

" Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'zchee/deoplete-jedi'

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

set number
set relativenumber
set cursorline
set title
set ruler
set list

set backspace=indent,eol,start
set autoread
set encoding=utf-8

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

let g:airline_theme='one'
set background=light
colorscheme one
let g:airline_theme='one'

if (empty($TMUX))
  if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

map <leader>bg :let &background = (&background == "dark"? "light" : "dark")<cr>
map <leader>c :nohlsearch<cr>

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

"-------------------------
" PLUGIN: Deoplete
" ------------------------
if has('nvim')
  " Enable deoplete on startup
  let g:deoplete#enable_at_startup = 1
endif

let g:deoplete#sources#go#pointer = 1

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
 \  'javascript': ['eslint'],
 \}

let g:ale_fix_on_save = 1

"-------------------------
" PLUGIN: CtrlP & FZF
" ------------------------
if (executable('fzf'))
  nnoremap <leader>ff :Ag<cr>
  let g:fzf_layout = { 'down': '~20%' }
  let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
  let g:ctrlp_map = ''
else
  nnoremap <leader>ff :CtrlP<space>
endif

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
let g:UltiSnipsSnippetsDir = "~/.config/nvim/snippets"
let g:UltiSnipsEditSplit = "vertical"
ket g:UltiSnipsUsePythonVersion = 3

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
" LANGUAGE: Go
" ------------------------
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }

au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4

" Mappings
au FileType go nmap <F8> :GoMetaLinter<cr>
au FileType go nmap <F9> :GoCoverageToggle -short<cr>
au FileType go nmap <F10> :GoTest -short<cr>
au FileType go nmap <F12> <Plug>(go-def)
au Filetype go nmap <leader>ga <Plug>(go-alternate-edit)
au Filetype go nmap <leader>gah <Plug>(go-alternate-split)
au Filetype go nmap <leader>gav <Plug>(go-alternate-vertical)
au FileType go nmap <leader>gt :GoDeclsDir<cr>
au FileType go nmap <leader>gc <Plug>(go-coverage-toggle)
au FileType go nmap <leader>gd <Plug>(go-def)
au FileType go nmap <leader>gdv <Plug>(go-def-vertical)
au FileType go nmap <leader>gdh <Plug>(go-def-split)
au FileType go nmap <leader>gD <Plug>(go-doc)
au FileType go nmap <leader>gDv <Plug>(go-doc-vertical)

" Run goimports when running gofmt
let g:go_fmt_command = "goimports"

" Show the progress when running :GoCoverage
let g:go_echo_command_info = 1

" Show type information
let g:go_auto_type_info = 1

" Highlight variable uses
let g:go_auto_sameids = 1

" Fix for location list when vim-go is used together with Syntastic
let g:go_list_type = "quickfix"

" Add the failing test name to the output of :GoTest
let g:go_test_show_name = 1

" gometalinter configuration
let g:go_metalinter_command = ""
let g:go_metalinter_deadline = "5s"
let g:go_metalinter_enabled = [
    \ 'deadcode',
    \ 'gas',
    \ 'goconst',
    \ 'gocyclo',
    \ 'golint',
    \ 'gosimple',
    \ 'ineffassign',
    \ 'vet',
    \ 'vetshadow'
\]

let g:go_addtags_transform = "camelcase"

"-------------------------
" LANGUAGE: Rust
" ------------------------
let g:rustfmt_autosave = 1
let g:deoplete#sources#rust#racer_binary = '/Users/david/.cargo/bin/racer' 
let g:deoplete#sources#rust#rust_source_path = '/Users/david/Projects/rust/src'
let g:deoplete#sources#rust#show_duplicates = 1
let g:deoplete#sources#rust#documentation_max_height = 20

au FileType rust set noexpandtab
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
" LANGUAGE: YAML
" ------------------------
au FileType yaml set expandtab
au FileType yaml set shiftwidth=2
au FileType yaml set softtabstop=2
au FileType yaml set tabstop=2

"-------------------------
" LANGUAGE: TypeScript
" ------------------------
au FileType typescript set expandtab
au FileType typescript set shiftwidth=4
au FileType typescript set softtabstop=4
au FileType typescript set tabstop=4

"-------------------------
" LANGUAGE: Bash
" ------------------------
au FileType sh set noexpandtab
au FileType sh set shiftwidth=2
au FileType sh set softtabstop=2
au FileType sh set tabstop=2
