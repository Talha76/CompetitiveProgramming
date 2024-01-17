" Auto import & Compile
:autocmd BufNewFile *.cpp 0r ~/template.cpp

nnoremap <F4> :!xclip -o -sel clip > ~/cp/in <CR><CR>
inoremap <F4> <ESC>:!xclip -o -sel clip > ~/cp/in <CR><CR>
nnoremap <F6> :!xclip -sel clip % <CR><CR>
inoremap <F6> <ESC>:!xclip -sel clip % <CR><CR>


autocmd filetype cpp nnoremap <F9>       :wa \| !make %:r && timeout 5s ./%:r < ~/cp/in> ~/cp/out<CR>
autocmd filetype cpp inoremap <F9>  <ESC>:wa \| !make %:r && timeout 5s  ./%:r < ~/cp/in> ~/cp/out<CR>
autocmd filetype cpp nnoremap <F10>      :wa \| !make clean && make %:r D=1 && ./%:r < ~/cp/in> ~/cp/out<CR>
autocmd filetype cpp inoremap <F10> <ESC>:wa \| !make clean && make %:r D=1 && ./%:r < ~/cp/in > ~/cp/out<CR>

autocmd filetype python nnoremap <F9> :wa \| !python % < ~/cp/in> ~/cp/out<CR>
autocmd filetype python inoremap <F9> <ESC>:wa \| !python % < ~/cp/in> ~/cp/out<CR>

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

set splitright splitbelow
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
" set ignorecase
set incsearch
set nowrap
set hlsearch

" bubt site
" set termguicolors
set foldmethod=indent
set nofoldenable
" set cursorline
set laststatus=2
set showcmd
set wildmenu
" colorscheme torte


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

nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

tnoremap <A-h> <C-\><C-n><A-h>
tnoremap <A-j> <C-\><C-n><A-j>
tnoremap <A-k> <C-\><C-n><A-k>
tnoremap <A-l> <C-\><C-n><A-l>

filetype plugin indent on    " required

" for development
let mapleader = ','
map <leader>dev :Lex<CR>60<C-w><<A-l><C-w>s12<C-w>-:term<CR><A-k>
map <leader>cp :50 vsplit in<CR>:split out<CR><C-w>h

let g:copilot_enabled = v:false

call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
