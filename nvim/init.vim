"###############################################################
"#  my init.vim for neovim                                     #
"#      >lastutpdate: 2019.01.24                               #
"#      >auther: Soichiro Yoshimura <yoshimura@soichiro.org>   #
"###############################################################
"VimをなるべくVi互換にする
set nocompatible

""""""""""" メモ """""""""""{{{
" 現在のファイルとのvimdiff
" :vertical diffsplit {差分を見たい対象ファイル名}
"
" 水平分割 C-W C-W で移動
" :split
"
" 自動インデントの各段階に使われる空白の数
" :set shiftwidth=2
"
" コピー＆ペーストモード
" :set paste
"
"}}}

""""""""""" Vimの基本的な設定  """""""""""{{{　
" バックスペースキーの動作を決定する
" 2:indent,eol,startと同じ
set backspace=2

" 行数表示
set number

" 検索で小文字なら大文字を無視、大文字なら無視しない設定
set smartcase

" (no)検索をファイルの末尾まで検索したら、ファイルの先頭へループする
set nowrapscan

" インクリメンタルサーチを行う
set incsearch

" 閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch

" カーソルが何行目の何列目に置かれているかを表示する
set ruler

" 保存しないで他のファイルを表示することが出来るようにする
set hidden

" カレントバッファ内のファイルの文字エンコーディングを設定する
set fileencoding=utf-8

" タブを4スペースに置き換える
set expandtab

" ファイル内の <Tab> が対応する空白の数
set tabstop=4

" 自動インデントの各段階に使われる空白の数
set shiftwidth=4

" 行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする
set smarttab

" 新しい行を開始したときに、新しい行のインデントを現在行と同じ量にする
set autoindent

" 新しい行を作ったときに高度な自動インデントを行う
set smartindent

" 強調表示(色付け)のON/OFF設定
syntax on

" 空白文字の可視化
set list

" 検索文字をハイライト
set hls

" 空白文字の可視化設定
set listchars=tab:>-,trail:.

" ステータスラインを表示するウィンドウを設定する
" 2:常にステータスラインを表示する
set laststatus=2

" ステータス行の表示内容を設定する
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}G8%=%l,%c%V%8P

" vimのバックアップファイルとスワップファイル
set nobackup
set noswapfile
set noundofile

" ビープ音をオフに設定
set vb t_vb=

"自動改行オフ
set tw=0

" マウスモード有効
set mouse=a

" MacVimやGVimを利用する際にIMEがモードの切替でオフとなる設定
set imdisable

" UTF-8文字化け対応
set termencoding=utf-8
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,cp932

" 256色対応
set t_Co=256

" txtファイルを自動改行しない
autocmd FileType text setlocal textwidth=0

" cppファイルをF4でコンパイルする
autocmd filetype cpp nnoremap <F4> :!g++ % -std=gnu++1y -O2 -o %:r <CR>

" cppファイルをF5でコンパイルして実行までする
autocmd filetype cpp nnoremap <F5> :!g++ % -std=gnu++1y -O2 -o %:r ; ./%:r <CR>

" F6で実行だけする
autocmd filetype cpp nnoremap <F6> :!./%:r <CR>

" cppファイルをF7でコピペしやすいようにコンソールにコードを表示
autocmd filetype cpp nnoremap <F7> :!cat % <CR>


" dein インストール
" https://github.com/Shougo/dein.vim
"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/ubuntu/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/ubuntu/.cache/dein')
  call dein#begin('/home/ubuntu/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/home/ubuntu/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  call dein#add('Shougo/deoplete.nvim')
  let g:deoplete#enable_at_startup = 1
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
" if dein#check_install()
"   call dein#install()
" endif

"End dein Scripts-------------------------

" neosnippetsの設定
let g:neosnippet#snippets_directory='~/.vim/my_snippet'

" SuperTab like snippets behavior.
imap  <expr><TAB>
    \ pumvisible() ? "\<C-n>" :
    \ neosnippet#expandable_or_jumpable() ?
    \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
    \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

if has('conceal')
  set conceallevel=2 concealcursor=i
endif
