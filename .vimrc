"###############################################################
"# My vimrc                                                    #
"#      >lastutpdate: 2018.08.25                               #
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

"自動改行オフ
set tw=0

" マウスモード有効
set mouse=a

" xtermとscreen対応
set ttymouse=xterm2

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
