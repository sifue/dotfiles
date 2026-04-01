"###############################################################
"#  my init.vim for neovim                                     #
"#      >lastupdate: 2026.04.01                                #
"#      >author: Soichiro Yoshimura <yoshimura@soichiro.org>   #
"###############################################################

set nocompatible

colorscheme evening

""""""""""" メモ """""""""""{{{
" :vertical diffsplit {file}
" :split
" :set shiftwidth=2
" :set paste
"}}}

""""""""""" Vimの基本的な設定 """""""""""{{{

set backspace=2
set number
set smartcase
set nowrapscan
set incsearch
set showmatch
set ruler
set hidden

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,cp932

set expandtab
set tabstop=4
set shiftwidth=4
set smarttab
set autoindent
set smartindent

syntax on

set list
set hls
nmap <Esc><Esc> :nohlsearch<CR>

set listchars=tab:>-,trail:.

set laststatus=2
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

set nobackup
set noswapfile
set noundofile

set vb t_vb=
set scrolloff=16
set textwidth=0
set mouse=a

" true color を使える端末なら有効化
if has('termguicolors')
  set termguicolors
endif

autocmd FileType text setlocal textwidth=0

" terminalモードからESCで戻る
tnoremap <silent> <Esc> <C-\><C-n>

" cppファイルをF4でコンパイルする
autocmd FileType cpp nnoremap <buffer> <F4> :split | terminal g++ % -std=gnu++1y -O2 -o %:r<CR>

" cppファイルをF5でコンパイルして実行までする
autocmd FileType cpp nnoremap <buffer> <F5> :split | terminal sh -c 'g++ "%" -std=gnu++1y -O2 -o "%:r" && "./%:r"'<CR>

" F6で実行だけする
autocmd FileType cpp nnoremap <buffer> <F6> :split | terminal ./%:r<CR>
