"###############################################################
"# My vimrc                                                    #
"#      >lastutpdate: 2012.11.09                               #
"#      >auther: Soichiro Yoshimura <yoshimura@soichiro.org>   #
"###############################################################
"VimをなるべくVi互換にする
set nocompatible

""""""""""" メモ """""""""""{{{
" 現在のファイルとのvimdiff
" :vertical diffsplit {差分を見たい対象ファイル名}
"
" 現在のファイルのカレントディレクトリに移動
" :cd %:h
"
" タブだけの行のタブを消す
" :%s/^\t\+$//g
"
" タブを2スペースに置き換える
" :set expandtab
" :set ts=2
"
"}}}
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
" :make時のエラーマーカーを表示
NeoBundle 'errormarker.vim'
" Uniteコマンドによるフィルタ付き読み出し等
NeoBundle 'Shougo/unite.vim'
" Uniteコマンドでアウトラインを表示
NeoBundle 'h1mesuke/unite-outline'
" キャッシュを備えた自動補完機能
NeoBundle 'Shougo/neocomplcache'
" :JSHintコマンドによるJS文法チェック
NeoBundle 'walm/jshint.vim'
" ,,でトグルでコメントアウト
NeoBundle 'scrooloose/nerdcommenter'
" Scalaのハイライト
NeoBundle 'derekwyatt/vim-scala'
" zendogingプラグイン
NeoBundle 'mattn/zencoding-vim'
" <Leader>rで:QuickRunという言語ごとの実行コマンド
NeoBundle 'thinca/vim-quickrun'
" URLエンコード、デコードするためのプラグイン
NeoBundle 'koron/chalice'
" SQL の整形のために必要なプラグイン
NeoBundle 'Align'
" 選択後 :SQLUFormatter でSQL整形
NeoBundle 'vim-scripts/SQLUtilities'
" PHP5.4にも対応している新しいPHPのシンタックスハイライト
NeoBundle 'shawncplus/php.vim'
" Smartyのシンタクスハイライト
NeoBundle 'sifue/smarty.vim'

""""""" vim-scripts repos
" プロジェクトのツリー表示
NeoBundle 'project.tar.gz'
" 括弧囲みの編集操作
NeoBundle 'surround.vim'
" SVNやgitなど http://blog.blueblack.net/item_144 :VCS* で実行
NeoBundle 'vcscommand.vim'
" :DirDiff <A:Src Directory> <B:Src Directory> でディレクトリ比較
NeoBundle 'DirDiff.vim'
" tabでスニペット補完
NeoBundle 'snipMate'
" F5でxDebugのリモートデバッグ開始 :Bp でブレークポイント ,eで変数評価
NeoBundle 'DBGp-client'
" JavaScriptのシンタクスハイライト
NeoBundle 'JavaScript-syntax'
" JavaScriptのインデント
NeoBundle 'pangloss/vim-javascript'

filetype on
filetype indent on
filetype plugin on
"}}}
""""""""""" プラグインごとの設定 """""""""""{{{　
" エラーマーカーの設定
let g:errormarker_disablemappings = 1
let g:errormarker_errortext = '!!'
let g:errormarker_warningtext = '??'
let g:errormarker_errorgroup = 'Error'
let g:errormarker_errorgroup = 'Todo'

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

" Neocomplcacheの設定
" Disable AutoComplPop.
let g:acp_enableAtStartup = 1
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" ,, でコメントアウトをトグル
let NERDSpaceDelims = 1
nmap ,, <Plug>NERDCommenterToggle
vmap ,, <Plug>NERDCommenterToggle

" <Leader>Pで、プロジェクトをトグルで開閉する
nmap <silent> <Leader>P <Plug>ToggleProject
" <Leader>pで、デフォルトのプロジェクトを開く(デフォルト設定のこと)
nmap <silent> <Leader>p :Project ~/.vimprojects<CR>
" サブプロジェクトを上に、vimgrepではなくgrepを使うように設定
let g:proj_flags = 'imstTv'

" URLエンコード(:URLEncode)、デコード(:URLDecode)
function! s:URLEncode()
	let l:line = getline('.')
	let l:encoded = AL_urlencode(l:line)
	call setline('.', l:encoded)
endfunction

function! s:URLDecode()
	let l:line = getline('.')
	let l:encoded = AL_urldecode(l:line)
	call setline('.', l:encoded)
endfunction

command! -nargs=0 -range URLEncode :<line1>,<line2>call <SID>URLEncode()
command! -nargs=0 -range URLDecode :<line1>,<line2>call <SID>URLDecode()

" zen-codingのインデント等の設定
let g:user_zen_settings = {
\  'lang' : 'ja',
\  'indentation' : '\t',
\  'html' : {
\    'indentation' : ' ',
\    'filters' : 'html',
\   },
\  'php' : {
\    'extends' : 'html',
\    'filters' : 'html,c',
\  },
\  'css' : {
\    'filters' : 'fc',
\  },
\}

" surrround.vimの設定
" Smartyテンプレート (選択してs1でtタグ、s2でptタグで囲う)
autocmd FileType html let b:surround_49  = "{t}\r{/t}"
autocmd FileType html let b:surround_50  = "{pt num=$template_param}\r{/pt}"

" Smartyのシンタクスハイライトを.htmlファイルにセット
au BufRead,BufNewFile *.html set filetype=smarty


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
" set expandtab

"ファイル内の <Tab> が対応する空白の数
set tabstop=4

"自動インデントの各段階に使われる空白の数
set shiftwidth=4

"行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする
"set smarttab

"強調表示(色付け)のON/OFF設定
syntax on

" カラースキーマ設定 (~/.vim/colors/wombat.vimなどが必要)
" MacVimでwombatを利用するとuniteが正しく表示できないで変更
if has('mac')
	" colorscheme wombat
	" colorscheme molokai
else
	colorscheme wombat
	" colorscheme molokai
endif

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

"コメントアウトが連続して入力されるのを禁止 :a!でも代用可
autocmd FileType * setlocal formatoptions-=ro

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

" Ctrl + Shift + u で選択した単語を現在のファイル内でgrep (レジスタu使用)
vnoremap <silent> <C-S-u> "uy:vimgrep /<C-r>u/ <C-r>%<CR>:copen<CR>gv=gv

" ヤンク、切り取り時にレジスタ"の値をzにもコピーしておく(連続貼付可に使う)
vnoremap <silent> y y:let @z=@"<CR>
vnoremap <silent> d d:let @z=@"<CR>

" ビジュアルモードで選択したテキストを消してレジスタzの内容を貼付ける(連続貼付可)
vnoremap <silent> p x"zP

" Ctrl + j で裏バッファに切り替え
nnoremap <silent> <C-j> <C-^>
vnoremap <silent> <C-j> <C-^>

" Ctrl + n or pでタブ移動
nnoremap <C-n> gt
nnoremap <C-p> gT

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

" UNCパスからsmbのURLに変更する(:SMBfromUNC)
function! SMBfromUNC()
  %s/\\\\/smb:\/\//g
  %s/\\/\//g
  echo "Convert from UNC."
endfunction
command! SMBfromUNC :call SMBfromUNC()

" smbのURLからUNCパスに変更する(:SMBtoUNC)
function! SMBtoUNC()
  %s/smb:\/\//\\\\/g
  %s/\//\\/g
  echo "Convert to UNC."
endfunction
command! SMBtoUNC :call SMBtoUNC()

" <Leader>u でカーソル下のURL開く
function! HandleURI()
  let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;:]*')
  echo s:uri
  if s:uri != ""
    exec "!open \"" . s:uri . "\""
  else
    echo "No URI found in line."
  endif
endfunction
map <Leader>u :call HandleURI()<CR>

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

"SQLのPHP文字リテラルへの整形(:Sqltop, :Sqlfromp)
function! SQLToPHP()
  %s/^\(.\+\)$/"\1 " \./g
  normal G$
  execute "normal ?.<CR>"
  normal xxggVG
  echo "Convert to PHP String is finished."
endfunction
command! Sqltop :call SQLToPHP()

function! SQLFromPHP()
  %s/^"\(.\+\) " *\.*$/\1/g
  normal ggVG
  echo "Convert from PHP String is finished."
endfunction
command! Sqlfromp :call SQLFromPHP()


""""" Java用設定 """"""""
"SQLのJava文字リテラルへの整形(:Sqltoj, :Sqlfromj)
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
" ファイルタイプの追加
augroup filetypedetect
	autocmd! BufNewFile,BufRead *.scala setfiletype scala
	autocmd! BufNewFile,BufRead *.sbt setfiletype scala
augroup END

"ユーザ定義の辞書を指定
let g:neocomplcache_dictionary_filetype_lists = {
  \ 'default' : '',
  \ 'scala' : $HOME . '/.vim/dict/scala.dict',
  \ }

"}}}
""""""""""" ローカルの設定があれば読み込 み """"""""""""{{{
if filereadable(expand('~/.vimrc.local'))
    source ~/.vimrc.local
endif
"}}}
