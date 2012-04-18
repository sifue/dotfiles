"###############################################################
"# My vimrc                                                    #
"#      >lastutpdate: 2012.04.18                               #
"#      >auther: Soichiro Yoshimura <yoshimura@soichiro.org>   #
"###############################################################
"VimをなるべくVi互換にする
set nocompatible

""""""""""" NeoBundle設定  """""""""""{{{
" https://github.com/Shougo/neobundle.vim
" インストール
" $ mkdir -p ~/.vim/bundle
" $ export GIT_SSL_NO_VERIFY=true
" $ git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
filetype plugin indent off     " required!
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

" gitを使ったプラグインマネージャ 基本Vundleと一緒
NeoBundle 'Shougo/neobundle.vim'

"""""""" github
" 強力な入力補完(Uniteと連携)
NeoBundle 'Shougo/neocomplcache'
" neocomを使ったスニペッツ補完
NeoBundle 'Shougo/neocomplcache-snippets-complete'
" Uniteコマンドによるフィルタ付き読み出し等
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
" <Leader>rで:QuickRunという言語ごとの実行コマンド
NeoBundle 'thinca/vim-quickrun'

""""""" vim-scripts repos
" プロジェクトのツリー表示
NeoBundle 'project.tar.gz'
" 括弧囲みの編集操作
NeoBundle 'surround.vim'
" :Tlistでctagsの一覧表示
NeoBundle 'taglist.vim'
" SVNやgitなどの差分表示用 http://blog.blueblack.net/item_144
NeoBundle 'vcscommand.vim'
" :DirDiff <A:Src Directory> <B:Src Directory> でディレクトリ比較
NeoBundle 'DirDiff.vim'
" マークを可視化(maでマーク、'aで呼び出し)
NeoBundle 'ShowMarks'
" :make時のエラーマーカーを表示
NeoBundle 'errormarker.vim'

filetype on
filetype indent on
filetype plugin on
"}}}
""""""""""" プラグインごとの設定 """""""""""{{{
" neocomplcache 起動時に有効化
let g:neocomplcache_enable_at_startup = 1

" Ctrl + kでNeoComのスニペッツを展開する :NeoComplCacheEditRuntimeSnippetsで確認
imap <C-k> <Plug>(neocomplcache_snippets_expand)
smap <C-k> <Plug>(neocomplcache_snippets_expand)

" NeoComの自作スニペッツのフォルダ読み込み :NeoComplCacheEditSnippetsで編集
let g:neocomplcache_snippets_dir = $HOME . '/.vim/snippets'

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

" ,, でコメントアウトをトグル
let NERDSpaceDelims = 1
nmap ,, <Plug>NERDCommenterToggle
vmap ,, <Plug>NERDCommenterToggle

" Ctrl +  o でタグアウトラインをトグル
nnoremap <C-o> :TlistToggle<CR>
" タグリストをコンパクトに表示
let Tlist_Compact_Format = 1
" 現在表示中のファイルのタグリストのみを表示
let Tlist_Show_One_File = 1
" タグの順番は名前でソートせずそのままの順番で
let Tlist_Sort_Type = "order"
" タグリストは右側に表示(project.vimのツリーが左にあるため)
let Tlist_Use_Right_Window = 1

" VCSコマンドの設定(Revertだけは確認のために<CR>を入力)
nnoremap <F1> :VCSLog<CR>
nnoremap <F2> :VCSVimDiff<CR> 
nnoremap <F4> :VCSRevert

" <Leader>Pで、プロジェクトをトグルで開閉する
nmap <silent> <Leader>P <Plug>ToggleProject
" <Leader>pで、デフォルトのプロジェクトを開く(デフォルト設定のこと)
nmap <silent> <Leader>p :Project ~/.pr/trunk<CR>
" サブプロジェクトを上に、vimgrepではなくgrepを使うように設定
let g:proj_flags = 'imstTv'

" マークの表示はアルファベットのみにする
let g:showmarks_include="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

" エラーマーカーの設定
let g:errormarker_errortext = '!!'
let g:errormarker_warningtext = '??'
let g:errormarker_errorgroup = 'Error'
let g:errormarker_errorgroup = 'Todo'


"}}}
""""""""""" 外部ツールの連携に関する設定  """""""""""{{{
" カレントディレクトリにてSVNのステータスを見る
nnoremap <F3> :tabnew<CR>:r!svn status -u<CR>

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
"set expandtab

"ファイル内の <Tab> が対応する空白の数
set tabstop=4

"自動インデントの各段階に使われる空白の数
set shiftwidth=4

"行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする
"set smarttab

"強調表示(色付け)のON/OFF設定
syntax on

" カラースキーマ設定 (~/.vim/colors/wombat.vimなどが必要)
colorscheme wombat

"ステータスラインを表示するウィンドウを設定する
"2:常にステータスラインを表示する
set laststatus=2

"ステータス行の表示内容を設定する
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}G8%=%l,%c%V%8P

"vimのバックアップファイルとスワップファイル
set nobackup
"set noswapfile

"バッファをクリップボードにコピー(for OSX)
if has('mac')
	 set clipboard=unnamed,autoselect
endif

"自動改行オフ
set tw=0

" マウスモード有効
set mouse=a

" xtermとscreen対応
set ttymouse=xterm2

"MacVimやGVimを利用する際にIMEがモードの切替でオフとなる設定
set imdisable

"ctagsの埋め込み 各環境であるものを全て記述(なくても問題ない)
set tags=~/.tags.ircbot,~/.tags.trunk,~/.tags.study 

"}}}
""""""""""" 効率化UPのための設定 """""""""""{{{
" <Leader>を\にリマッップ
nnoremap \ <Leader>
vnoremap \ <Leader>

" 全てのバッファを捨てて強制終了する
nnoremap <C-x>c :qall!<CR>

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

" fでカーソル下のファイル名を新しいタブで開く
nnoremap f :tabe <cfile><CR>
vnoremap f :tabe <cfile><CR>

" 検索語が画面中央にくるように
nmap n nzz
nmap N Nzz

" rで選択テキストでカレントディレクトリ以下をファイル検索してリストで出す(レジスタf使用)
vnoremap r "fy:tabnew<CR>:r!find . -iregex ".*<C-r>f.*"<CR><ESC>==gg

" Ctrl + Shift + u で選択した単語を現在のファイル内でgrep (レジスタu使用)
vnoremap <silent> <C-S-u> "uy:vimgrep /<C-r>u/ <C-r>%<CR>:copen<CR>gv=gv

" Ctrl + xからrでカレントディレクトリ化のファイル一覧の出力を新しいバッファに行う
nnoremap <C-x>r :tabnew<CR>>:r!find . -iregex ".*.*"<Left><Left><Left>

" ヤンク、切り取り時にレジスタ"の値をzにもコピーしておく(連続貼付可に使う)
vnoremap <silent> y y:let @z=@"<CR>
vnoremap <silent> d d:let @z=@"<CR>

" ビジュアルモードで選択したテキストを消してレジスタzの内容を貼付ける(連続貼付可)
vnoremap <silent> p x"zP

" Ctrl + n or pでバッファを行き来
nnoremap <silent> <C-p> :bp<CR>
nnoremap <silent> <C-n> :bn<CR>

" Ctrl + j で裏バッファに切り替え
nnoremap <silent> <C-j> <C-^>
vnoremap <silent> <C-j> <C-^> 

" Ctrl + Shift +  n or pでタブ移動
nnoremap <C-N> gt
nnoremap <C-P> gT

" vimrcの新しいタブでの編集と読み込みのショートカット設定
nnoremap ;s :source $MYVIMRC<CR>
nnoremap ;v :tabe $MYVIMRC<CR>
nnoremap ;l :tabe ~/.vimrc.local<CR>

" :DeleteHideBufferで全ての隠れているバッファを削除する
function! s:delete_hide_buffer()
	let list = filter(range(1, bufnr("$")), "bufexists(v:val) && !buflisted(v:val)")
	for num in list
		execute "bw ".num
	endfor
endfunction
command! DeleteHideBuffer :call s:delete_hide_buffer()

" :makeや:grepをした際に自動的にquickfixが開くようにする
autocmd QuickfixCmdPost make,grep,grepadd,vimgrep,vimgrepadd if len(getqflist()) != 0 | copen | endif

" テキストファイル専用の設定
augroup ettext
	autocmd!
	autocmd BufRead,BufNewFile *.txt setlocal expandtab nolist nonumber tw=0
augroup END

" UNCパスからsmbのURLに変更する
function! SMBfromUNC()
  %s/\\\\/smb:\/\//g
  %s/\\/\//g
  echo "Convert from UNC."
endfunction
command! SMBfromUNC :call SMBfromUNC()

" smbのURLからUNCパスに変更する
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
" 各言語で保存する際に:makeと:cw(エラーがあれば開く)を実施
if !exists('g:flymake_enabled')
	let g:flymake_enabled = 1
	autocmd BufWritePost *.rb,*.php,*.py,*.pl silent make
	autocmd BufWritePost *.rb,*.php,*.py,*.pl silent cw
endif

""""" VIM用設定 """"""""
" vimファイルに関して{と}による折りたたみ設定をする
au FileType vim setlocal foldmethod=marker

""""" PHP用設定 """"""""
" :makeでPHP構文チェック
au FileType php setlocal makeprg=php\ -l\ %
au FileType php setlocal errorformat=%m\ in\ %f\ on\ line\ %l

" PHPの関数やクラスの折りたたみ
let php_folding = 1

" 文字列の中のSQLをハイライト
let php_sql_query = 1

" HTMLもハイライト
let php_htmlInStrings = 1

" <? を無効にする→ハイライト除外にする
let php_noShortTags = 1

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

"}}}
""""""""""" ローカルの設定があれば読み込み """"""""""""{{{
if filereadable(expand('~/.vimrc.local'))
    source ~/.vimrc.local
endif
"}}}
