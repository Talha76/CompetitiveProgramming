" nmap <F6> :NERDTreeToggle<CR>
nnoremap <silent> <expr> <F5> g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"

set nocompatible              " be iMproved, required
filetype off                  " required
syntax on
" set relativenumber

set mouse=a
set number
set tabstop=2
set shiftwidth=2
set expandtab
set noerrorbells
set softtabstop=2
set smartindent
set smarttab
set autoindent
set cindent
set ruler
set guifont=*
set backspace=indent,eol,start
" set clipboard=unnamedplus

if !has('nvim')
  set clipboard=autoselect,unnamed,exclude:cons\|linux
endif
if !has('nvim')
  set ttymouse=xterm2
endif

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
Plugin 'SirVer/ultisnips'
Plugin 'adelarsq/vim-matchit'
Plugin 'elzr/vim-json'
Plugin 'honza/vim-snippets'
Plugin 'justinmk/vim-sneak'
Plugin 'kien/ctrlp.vim'
Plugin 'ludovicchabant/vim-lawrencium'
Plugin 'majutsushi/tagbar'
Plugin 'mhinz/vim-signify'
Plugin 'plasticboy/vim-markdown'
Plugin 'scrooloose/nerdcommenter'
Plugin 'sjl/gundo.vim'
Plugin 'tpope/vim-fugitive'
" Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-surround'
Plugin 'tyru/open-browser.vim'
Plugin 'vim-scripts/a.vim'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
if !has('nvim')
  Plugin 'ycm-core/YouCompleteMe'
endif
Plugin 'gruvbox-community/gruvbox'
Plugin 'vim-utils/vim-man'
Plugin 'sainnhe/gruvbox-material'
Plugin 'phanviet/vim-monokai-pro'
Plugin 'ajh17/VimCompletesMe'

" Color Schemes
Plugin 'tomasr/molokai'
Plugin 'flazz/vim-colorschemes'
call vundle#end()            " required
filetype plugin indent on    " required


let g:gruvbox_contrast_dark = 'hard'
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'

" --- The Greatest plugin of all time.  I am not bias
" let g:vim_be_good_floating = 0

" --- vim go (polyglot) settings.
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_auto_sameids = 1

colorscheme gruvbox
set background=dark

call plug#begin()
Plug 'searleser97/cpbooster.vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tribela/vim-transparent'
call plug#end()
