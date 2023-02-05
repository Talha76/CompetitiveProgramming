nmap <F5> :NERDTreeToggle<CR>
" nnoremap <silent> <expr> <F5> g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"

" Auto import & Compile
" :autocmd BufNewFile *.cpp 0r ~/template.cpp

autocmd filetype cpp nnoremap <F9>  :w \| !g++ -std=gnu++2a -Wall -g % -o %:r && ./%:r<CR>
autocmd filetype cpp inoremap <F9>  <ESC>:w \| !g++ -std=gnu++2a -Wall -g % -o %:r && ./%:r<CR>
autocmd filetype cpp nnoremap <F10> :w \| !g++ -std=c++17 -Wall -g -DMUSHFIQ_DEBUG -DDBG_MACRO_NO_WARNING % -o %:r && ./%:r<CR>
autocmd filetype cpp inoremap <F10> <ESC>:w \| !g++ -std=c++17 -Wall -g -DMUSHFIQ_DEBUG -DDBG_MACRO_NO_WARNING % -o %:r && ./%:r<CR>

autocmd filetype python nnoremap <F9> :w \| !python3 %<CR>
autocmd filetype python inoremap <F9> <ESC>:w \| !python3 %<CR>

" cp-booster
inoremap <F7> <ESC>:Test<CR>
nnoremap <F7> :Test<CR>
vnoremap <F7> :Test<CR>
inoremap <F8> <ESC> :Submit<CR>
nnoremap <F8> :Submit<CR>
vnoremap <F8> :Submit<CR>

" Auto Completion
inoremap ( ()<left>
inoremap <expr> ) strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
inoremap { {}<left>
inoremap <expr> } strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"
inoremap [ []<left>
inoremap <expr> ] strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"
inoremap <expr> " strpart(getline('.'), col('.')-1, 1) == "\"" ? "\<Right>" : "\"\"\<left>"
inoremap <expr> ' strpart(getline('.'), col('.')-1, 1) == "\'" ? "\<Right>" : "\'\'\<left>"

inoremap <expr> <CR> <sid>insert_newline()
function s:insert_newline() abort
  let pair = strpart(getline('.'), col('.')-2, 2)
  return stridx('(){}[]', pair) % 2 == 0 && strlen(pair) == 2 ? "\<CR>\<ESC>\O" : "\<CR>"
endfunction

inoremap <expr> <space> <sid>insert_space()
function s:insert_space() abort
  let pair = strpart(getline('.'), col('.')-2, 2)
  return stridx('(){}[]', pair) % 2 == 0 && strlen(pair) == 2 ? "\<space>\<space>\<left>" : "\<space>"
endfunction

inoremap <expr> <bs> <sid>rm_pair()
function s:rm_pair() abort
	let pair = strpart(getline('.'), col('.')-2, 2)
	return stridx('(){}[]''''""', pair) % 2 == 0 && strlen(pair) == 2 ? "\<del>\<bs>" : "\<bs>"
endfunction

set nocompatible              " be iMproved, required
filetype on                  " required
filetype plugin on
filetype plugin indent on
syntax on

set mouse=a
set number
set relativenumber
set tabstop=2
set shiftwidth=2
set expandtab
set softtabstop=2
set smartindent
set smarttab
set autoindent
set cindent
set noerrorbells
set ruler
set guifont=*
set backspace=indent,eol,start
set ignorecase
set incsearch
set nowrap
set hlsearch

" bubt site
" set termguicolors
set foldmethod=indent
set nofoldenable
set cursorline
set laststatus=2
set showcmd
set wildmenu


if !has('nvim')
  set clipboard=unnamedplus
endif
if !has('nvim')
  set ttymouse=xterm2
endif

nnoremap <S-j> :m .+1<CR>==
nnoremap <S-k> :m .-2<CR>==
vnoremap <S-j> :m '>+1<CR>gv==gv
vnoremap <S-k> :m '<-2<CR>gv==gv

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-syntastic/syntastic'
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
Plugin 'alvan/vim-closetag'
Plugin 'searleser97/cpbooster.vim'
Plugin 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plugin 'neoclide/coc.nvim', {'branch': 'release'}

" Plugin 'jiangmiao/auto-pairs'
" Plugin 'pseewald/vim-anyfold'

" Color Schemes
Plugin 'tomasr/molokai'
Plugin 'flazz/vim-colorschemes'
Plugin 'tribela/vim-transparent'
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

" Warnings
let g:syntastic_cpp_compiler_options = '-Wall'

colorscheme gruvbox
set background=dark

" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'

let g:python3_host_prog = '/usr/bin/python3'
