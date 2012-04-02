")VimをなるべくVi互換にする
set nocompatible

"""""""""" vundle設定 """"""""""
" ファイル形式の検出を無効にする  
filetype off  

" https://github.com/gmarik/vundle
" Vundle を初期化して  
" Vundle 自身も Vundle で管理
" 以下に追記後 :BundleInstall
" これでインストール可能になる
set rtp+=~/.vim/bundle/vundle/  
call vundle#rc()  
Bundle 'gmarik/vundle'  

" github
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/unite.vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'walm/jshint.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'derekwyatt/vim-scala'

" vim-scripts repos
Bundle 'project.tar.gz'
Bundle 'surround.vim'
""""""""""""""""""""""""""""""""

"バックスペースキーの動作を決定する
"2:indent,eol,startと同じ
set backspace=2

"行数表示
set number

"新しい行を開始したときに、新しい行のインデントを現在行と同じ量にする
set autoindent

"検索で小文字なら大文字を無視、大文字なら無視しない設定
set smartcase

"(no)検索をファイルの末尾まで検索したら、ファイルの先頭へループする
set nowrapscan

"インクリメンタルサーチを行う
set incsearch

"highlight matches with last search pattern
set hlsearch

"閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch

"カーソルが何行目の何列目に置かれているかを表示する
set ruler

"新しい行を作ったときに高度な自動インデントを行う
set smartindent

"保存しないで他のファイルを表示することが出来るようにする
set hidden

"カレントバッファ内のファイルの文字エンコーディングを設定する
set fileencoding=utf-8

"Insertモードで<Tab> を挿入するのに、適切な数の空白を使う
set expandtab

"ファイル内の <Tab> が対応する空白の数
set tabstop=2

"自動インデントの各段階に使われる空白の数
set shiftwidth=2

"行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする
set smarttab

"強調表示(色付け)のON/OFF設定
syntax on

"ステータスラインを表示するウィンドウを設定する
"2:常にステータスラインを表示する
set laststatus=2

"ステータス行の表示内容を設定する
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

filetype on
filetype indent on
filetype plugin on

" 追加設定

"http://www.vim.org/scripts/script.php?script_id=2332
"Vundle を利用するようにしたため、利用中止。
"call pathogen#infect()

"SQLのJava文字リテラルへの整形
function! SQLToJava()
  %s/^\(.\+\)$/"\1 " \+/g
  normal G$
  execute "normal ?+\<CR>"
  normal xxggVG
  echo "Convert to Java String is finished."
endfunction
command! Sqltoj :call SQLToJava()

function! SQLFromJava()
  %s/^"\(.\+\) " *+*$/\1/g
  normal ggVG
  echo "Convert from Java String is finished."
endfunction
command! Sqlfromj :call SQLFromJava()

"vimのバックアップファイルとスワップファイル
set nobackup
set noswapfile

"バッファをクリップボードにコピー
set clipboard=unnamed,autoselect

"自動改行オフ
set tw=0

" PHP構文チェック
au FileType php setlocal makeprg=php\ -l\ %
au FileType php setlocal errorformat=%m\ in\ %f\ on\ line\ %l

" Ruby構文チェック
au FileType ruby setlocal makeprg=ruby\ -c\ %
au FileType ruby setlocal errorformat=%m\ in\ %f\ on\ line\ %l

" neocomplcache
let g:neocomplcache_enable_at_startup = 1 " 起動時に有効化

" Command + j or k で行を移動する
nnoremap <D-j> :m+<CR>==
nnoremap <D-k> :m-2<CR>==
inoremap <D-j> <Esc>:m+<CR>==gi
inoremap <D-k> <Esc>:m-2<CR>==gi
vnoremap <D-j> :m'>+<CR>gv=gv
vnoremap <D-k> :m-2<CR>gv=gv

" ,, でコメントアウトをトグル
let NERDSpaceDelims = 1
nmap ,, <Plug>NERDCommenterToggle
vmap ,, <Plug>NERDCommenterToggle

"ユーザ定義の辞書を指定
let g:neocomplcache_dictionary_filetype_lists = {
  \ 'default' : '',
  \ 'scala' : $HOME . '/.vim/dict/scala.dict',
  \ }

