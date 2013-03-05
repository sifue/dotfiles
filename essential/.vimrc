"VimをなるべくVi互換にする
set nocompatible

""""""""""" NeoBundle設定  """""""""""{{{
" https://github.com/Shougo/neobundle.vim
" インストール
" $ mkdir -p ~/.vim/bundle
" $ export GIT_SSL_NO_VERIFY=true
" $ git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
" :NeoBundleInstall でプラグインインストール :NeoBundleInstall! で更新
filetype plugin indent off     " required!
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

" gitを使ったプラグインマネージャ 基本Vundleと一緒
NeoBundle 'Shougo/neobundle.vim'

"""""""" github
" Uniteコマンドによるフィルタ付き読み出し等
NeoBundle 'Shougo/unite.vim'
" Uniteコマンドでアウトラインを表示
NeoBundle 'h1mesuke/unite-outline'
" PHP5.4にも対応している新しいPHPのシンタックスハイライト
NeoBundle 'shawncplus/php.vim'
" Ctrl+pで起動するファジー検索に対応したファイラー
NeoBundle 'kien/ctrlp.vim'

" SVNやgitなど http://blog.blueblack.net/item_144 :VCS* で実行
NeoBundle 'vcscommand.vim'
" tabでスニペット補完
NeoBundle 'snipMate'

filetype on
filetype indent on
filetype plugin on
"}}}
""""""""""" プラグインごとの設定 """""""""""{{{
" Unite起動時にインサートモードで開始
let g:unite_enable_start_insert = 1

" Uniteの各種ショートカット設定
" バッファ一覧
nnoremap <silent> ;ub :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> ;uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" レジスタ一覧
nnoremap <silent> ;ur :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> ;um :<C-u>Unite file_mru<CR>
" 全部乗せ
nnoremap <silent> ;ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

" Ctrl +  o でタグアウトラインを表示
nnoremap <C-o> :<C-u>Unite outline<CR>

"}}}
""""""""""" Vimの基本的な設定  """""""""""{{{
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
set ts=4

"ファイル内の <Tab> が対応する空白の数
set tabstop=4

"自動インデントの各段階に使われる空白の数
set shiftwidth=4

"行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする
"set smarttab

"強調表示(色付け)のON/OFF設定
syntax on

"ステータスラインを表示するウィンドウを設定する
"2:常にステータスラインを表示する
set laststatus=2

"ステータス行の表示内容を設定する
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}G8%=%l,%c%V%8P

"vimのバックアップファイルとスワップファイル
set nobackup
set noswapfile

"バッファをクリップボードにコピー(for OSX)
set clipboard=unnamed,autoselect

"自動改行オフ
set tw=0

" マウスモード有効
set mouse=a

" xtermとscreen対応
set ttymouse=xterm2

"MacVimやGVimを利用する際にIMEがモードの切替でオフとなる設定
set imdisable

"UTF-8文字化け対応
set termencoding=utf-8
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,cp932


"}}}
""""""""""" 効率化UPのための設定 """""""""""{{{
" <Leader>を\にリマッップ
nnoremap \ <Leader>
vnoremap \ <Leader>

"全角スペースを　で表示
highlight JpSpace cterm=underline ctermfg=Blue guifg=Blue
au BufRead,BufNew * match JpSpace /　/

"タブを見えるように設定
set list
set listchars=tab:>-,trail:-

" サーチハイライトををESC二回で消す
nnoremap <Esc><Esc> :nohlsearch<CR><Esc>

" 挿入モードとノーマルモードでステータスラインの色を変更する
au InsertEnter * hi StatusLine guifg=DarkBlue guibg=DarkYellow gui=none ctermfg=Blue ctermbg=Yellow cterm=none
au InsertLeave * hi StatusLine guifg=Black guibg=White gui=none ctermfg=Black ctermbg=White cterm=none

"バイナリ編集(xxd)モード（vim -b での起動、もしくは *.bin で発動します）
augroup BinaryXXD
	autocmd!
	autocmd BufReadPre  *.bin let &binary =1
	autocmd BufReadPost * if &binary | silent %!xxd -g 1
	autocmd BufReadPost * set ft=xxd | endif
	autocmd BufWritePre * if &binary | %!xxd -r
	autocmd BufWritePre * endif
	autocmd BufWritePost * if &binary | silent %!xxd -g 1
	autocmd BufWritePost * set nomod | endif
augroup END

" ヴィジュアルモードで選択したテキストをnで検索する(レジスタv使用)
vnoremap <silent> n "vy/\V<C-r>=substitute(escape(@v,'\/'),"\n",'\\n','g')<CR><CR>

" gfでカーソル下のファイル名を新しいタブで開く
nnoremap gf :tabe <cfile><CR>
vnoremap gf :tabe <cfile><CR>

" 検索語が画面中央にくるように
nmap n nzz
nmap N Nzz

" ヤンク、切り取り時にレジスタ"の値をzにもコピーしておく(連続貼付可に使う)
vnoremap <silent> y y:let @z=@"<CR>
vnoremap <silent> d d:let @z=@"<CR>

" ビジュアルモードで選択したテキストを消してレジスタzの内容を貼付ける(連続貼付可)
vnoremap <silent> p x"zP

" vimrcの新しいタブでの編集と読み込みのショートカット設定
nnoremap ;s :source $MYVIMRC<CR>
nnoremap ;v :tabe $MYVIMRC<CR>
nnoremap ;g :tabe $MYGVIMRC<CR>
nnoremap ;l :tabe ~/.vimrc.local<CR>

" :makeや:grepをした際に自動的にquickfixが開くようにする
autocmd QuickfixCmdPost make,grep,grepadd,vimgrep,vimgrepadd if len(getqflist()) != 0 | cw | endif

" テキストファイル専用の設定
augroup ettext
	autocmd!
	autocmd BufRead,BufNewFile *.txt setlocal expandtab nolist nonumber tw=0
augroup END

" ファイルを開いたときに前回の編集箇所に移動
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif


"}}}
""""""""""" 言語ごとの設定 """""""""""{{{
"ctagsのファイルをカレントディレクトリから検索して上位にあるもの読み込む
if has('path_extra')
	set tags+=tags;
endif

""""" VIM用設定 """"""""
" vimファイルに関して{と}による折りたたみ設定をする
au FileType vim setlocal foldmethod=marker

""""" PHP用設定 """"""""
" :makeでPHP構文チェック
au FileType php setlocal makeprg=php\ -l\ %
au FileType php setlocal errorformat=%m\ in\ %f\ on\ line\ %l

" PHPの関数やクラスの折りたたみ(非常に重い）
let php_folding = 0

" 文字列の中のSQLをハイライト
let php_sql_query = 1

" Baselibメソッドのハイライト
let php_baselib = 1

" HTMLもハイライト
let php_htmlInStrings = 1

" <? を無効にする→ハイライト除外にする
let php_noShortTags = 1

" ] や ) の対応エラーをハイライト
let php_parent_error_close = 1
let php_parent_error_open = 1


"}}}
