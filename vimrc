
" basic {{
set number
set ruler
set showcmd
set nobackup
set noswapfile
set cursorline
set autoindent
set cindent
set smarttab
set expandtab
set smartindent
set wildmenu
set hlsearch
set nowrap
set guifont=monaco
set encoding=utf-8
set mouse=a
set tabstop=4
set shiftwidth=4
set softtabstop=4
set history=1000
" }}

" leader {{
let mapleader=","
nmap <leader>w :w!<CR>
nmap <leader>q :q<CR>
nmap <leader>q1 :q!<CR>
nmap <leader>wq :wq<CR>
nmap <leader>WQ :wq<CR>
nmap <leader>Q :wq<CR>
nmap <leader>y "+y
nmap <leader>p "+p

" clear highlight
nmap <leader>l :noh<CR>
"buffer
nmap <leader><Tab> :bn<CR>
" }}
"

" hightlight
syntax enable
syntax on
set shortmess=atI

" color
" airline can be display when set this
set t_Co=256
set laststatus=2
set noshowmode
set background=dark
colorscheme dracula "molokai
let g:onedark_termcolors=256

filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

