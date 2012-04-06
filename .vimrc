"###############################################################
"# My vimrc                                                    #
"#      >lastutpdate: 2012.04.06                              #
"#      >auther: Soichiro Yoshimura <yoshimura@soichiro.org>   #
"###############################################################

")VimをなるべくVi互換にする
set nocompatible

"""""""""" NeoBundle設定 """"""""""
" https://github.com/Shougo/neobundle.vim
" インストール
" $ mkdir -p ~/.vim/bundle
" $ git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
filetype plugin indent off     " required!
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

" gitを使ったプラグインマネージャ
NeoBundle 'Shougo/neobundle.vim'

"""""""" github
" 強力なオムニ補完
NeoBundle 'Shougo/neocomplcache'
" Uniteコマンドによる読み出し
NeoBundle 'Shougo/unite.vim'
" CoffeeScriptのハイライト
NeoBundle 'kchmck/vim-coffee-script'
" :JSHintコマンドによるJS文法チェック
NeoBundle 'walm/jshint.vim'
" ,,でトグルでコメントアウト
NeoBundle 'scrooloose/nerdcommenter'
" Scalaのハイライト
NeoBundle 'derekwyatt/vim-scala'
" zendogingプラグイン
NeoBundle 'mattn/zencoding-vim'

""""""" vim-scripts repos
" プロジェクトのツリー表示
NeoBundle 'project.tar.gz'
" 括弧囲みの編集操作
NeoBundle 'surround.vim'
" :Tlistでctagsの一覧表示
NeoBundle 'taglist.vim'
" SVNの差分表示用 http://blog.blueblack.net/item_144
NeoBundle 'vcscommand.vim'

filetype on
filetype indent on
filetype plugin on

"""""""""" 追加設定 """"""""""
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
"set expandtab

"ファイル内の <Tab> が対応する空白の数
set tabstop=4

"自動インデントの各段階に使われる空白の数
set shiftwidth=4

"行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする
set smarttab

"強調表示(色付け)のON/OFF設定
syntax on

" カラースキーマ設定 (~/.vim/colors/wombat.vimが必要)
colorscheme wombat

"ステータスラインを表示するウィンドウを設定する
"2:常にステータスラインを表示する
set laststatus=2

"ステータス行の表示内容を設定する
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

"vimのバックアップファイルとスワップファイル
set nobackup
set noswapfile

"バッファをクリップボードにコピー(for OSX, UNIXのgvim用)
set clipboard=unnamed,autoselect

"自動改行オフ
set tw=0

" neocomplcache 起動時に有効化
let g:neocomplcache_enable_at_startup = 1 " 起動時に有効化

" ,, でコメントアウトをトグル
let NERDSpaceDelims = 1
nmap ,, <Plug>NERDCommenterToggle
vmap ,, <Plug>NERDCommenterToggle

"コメントアウトが連続して入力されるのを禁止
autocmd FileType * setlocal formatoptions-=ro

"全角スペースを　で表示
highlight JpSpace cterm=underline ctermfg=Blue guifg=Blue
au BufRead,BufNew * match JpSpace /　/

"タブを見えるように設定
set list
set listchars=tab:»\ 

" サーチハイライトををESC二回で消す
nnoremap <Esc><Esc> :nohlsearch<CR><Esc>

"ctagsの埋め込み 各環境であるものを全て記述(なくても問題ない)
set tags=~/.tags.trunk,~/.tags.study 

" マウスモード有効
set mouse=a
" screen対応
set ttymouse=xterm2

"""""""""" 言語ごとの設定 """"""""""
" /**の入力 Ctrl+]でコメントスニペット挿入
inoreabbrev /** /**<CR> * <CR>* <CR>*/

""""" PHP用設定 """"""""
" :makeでPHP構文チェック
au FileType php setlocal makeprg=php\ -l\ %
au FileType php setlocal errorformat=%m\ in\ %f\ on\ line\ %l
 
" phpのコードスニペット
au FileType php inoreabbrev vd var_dump();<Left><Left>

""""" Java用設定 """"""""
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

""""" Ruby用設定 """"""""
" :makeでRuby構文チェック
au FileType ruby setlocal makeprg=ruby\ -c\ %
au FileType ruby setlocal errorformat=%m\ in\ %f\ on\ line\ %l

""""" Scala用設定 """"""""
"ユーザ定義の辞書を指定
let g:neocomplcache_dictionary_filetype_lists = {
  \ 'default' : '',
  \ 'scala' : $HOME . '/.vim/dict/scala.dict',
  \ }

