"###############################################################
"# My vimrc                                                    #
"#      >lastutpdate: 2012.04.11                               #
"#      >auther: Soichiro Yoshimura <yoshimura@soichiro.org>   #
"###############################################################

")VimをなるべくVi互換にする
set nocompatible

""""""""""" NeoBundle設定  """"""""""""""""
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

" gitを使ったプラグインマネージャ
NeoBundle 'Shougo/neobundle.vim'

"""""""" github
" 強力な入力補完(Uniteと連携)
NeoBundle 'Shougo/neocomplcache'
" neocomを使ったスニペッツ補完
NeoBundle 'Shougo/neocomplcache-snippets-complete'
" Uniteコマンドによる読み出し等
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

""""""""""" プラグインの設定 """"""""""""""""
" neocomplcache 起動時に有効化
let g:neocomplcache_enable_at_startup = 1

" ,, でコメントアウトをトグル
let NERDSpaceDelims = 1
nmap ,, <Plug>NERDCommenterToggle
vmap ,, <Plug>NERDCommenterToggle

" Ctrl +  o でタグアウトライン
nnoremap <C-o> :Tlist<CR> 
inoremap <C-o> <ESC>:Tlist<CR>
vnoremap <C-o> :Tlist<CR>

" VCSコマンドの設定(Revertだけは確認のために<CR>を入力)
nnoremap <F1> :VCSLog<CR>
nnoremap <F2> :VCSVimDiff<CR> 
nnoremap <F4> :VCSRevert

" <Leader>Pで、プロジェクトをトグルで開閉する
nmap <silent> <Leader>P <Plug>ToggleProject

" <Leader>pで、デフォルトのプロジェクトを開く(デフォルト設定のこと)
nmap <silent> <Leader>p :Project ~/.pr/trunk<CR>

" Ctrl + kでNeoComのスニペッツを展開する
imap <C-k> <Plug>(neocomplcache_snippets_expand)
smap <C-k> <Plug>(neocomplcache_snippets_expand)

" NeoComの自作スニペッツのフォルダ読み込み
let g:neocomplcache_snippets_dir = $HOME . '/.vim/snippets'


""""""""""" 外部ツールの連携に関する設定  """"""""""""""""
" カレントディレクトリにてSVNのステータスを見る
nnoremap <F3> :new<CR>:r!svn status -u<CR>


""""""""""" Vimの基本的な設定  """"""""""""""""
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

" カラースキーマ設定 (~/.vim/colors/wombat.vimが必要)
colorscheme wombat

"ステータスラインを表示するウィンドウを設定する
"2:常にステータスラインを表示する
set laststatus=2

"ステータス行の表示内容を設定する
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}G8%=%l,%c%V%8P

"vimのバックアップファイルとスワップファイル
set nobackup
set noswapfile

"バッファをクリップボードにコピー(for OSX)
if has('mac')
	 set clipboard=unnamed,autoselect
endif

"自動改行オフ
set tw=0

" マウスモード有効
set mouse=a
" screen対応
set ttymouse=xterm2

"ctagsの埋め込み 各環境であるものを全て記述(なくても問題ない)
set tags=~/.tags.ircbot,~/.tags.trunk,~/.tags.study 


""""""""""" 効率化UPのための設定 """"""""""""""""
" <Leader>を\にリマッップ
nnoremap \ <Leader>
vnoremap \ <Leader>

" Ctlr + aで全体選択
nnoremap <silent> <C-a> ggVG<CR>==
inoremap <silent> <C-a> <Esc>ggVG<CR>==gi
vnoremap <silent> <C-a> ggVG<CR>gv=gv

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

" fでカーソル下のファイル名を新しいウインドウで開く
nnoremap f <C-w>f
vnoremap f <C-w>f

" fiで選択テキストでカレントディレクトリ以下をファイル検索してリストで出す(レジスタf使用)
vnoremap fi "fy:new<CR>:r!find . -iregex ".*<C-r>f.*"<CR><ESC>==gg

" ヤンク、切り取り時にレジスタ"の値をzにもコピーしておく(連続貼付可に使う)
vnoremap <silent> y y:let @z=@"<CR>
vnoremap <silent> d d:let @z=@"<CR>

" ビジュアルモードで選択したテキストを消してレジスタzの内容を貼付ける(連続貼付可)
vnoremap <silent> p x"zP

" Ctlr + Shift + 左右でバッファを行き来
nnoremap <silent> <C-p> :bp<CR>
nnoremap <silent> <C-n> :bn<CR>
vnoremap <silent> <C-p> :bn<CR>gv=gv
vnoremap <silent> <C-n> :bp<CR>gv=gv

" Ctlr + Shift + u で選択した単語を現在のファイル内でgrep (レジスタu使用)
vnoremap <silent> <C-S-u> "uy:vimgrep /<C-r>u/ <C-r>%<CR>:copen<CR>gv=gv

" vimrcとgvimrcを開く設定
nnoremap <Space>ev  :<C-u>edit $MYVIMRC<CR>
nnoremap <Space>eg  :<C-u>edit $MYGVIMRC<CR>

" vimrcとgvimrcを読み込み設定
nnoremap <Space>rv :<C-u>source $MYVIMRC \| if has('gui_running') \| source $MYGVIMRC \| endif <CR>
nnoremap <Space>rg :<C-u>source $MYGVIMRC<CR>

" vimrcとgvimrcの編集がされたときに自動的に読み込むため設定
augroup MyAutoCmd
	autocmd!
augroup END

if !has('gui_running') && !(has('win32') || has('win64'))
	" .vimrcの再読込時にも色が変化するようにする
	autocmd MyAutoCmd BufWritePost $MYVIMRC nested source $MYVIMRC
else
	" .vimrcの再読込時にも色が変化するようにする
	autocmd MyAutoCmd BufWritePost $MYVIMRC source $MYVIMRC | 
				\if has('gui_running') | source $MYGVIMRC  
	autocmd MyAutoCmd BufWritePost $MYGVIMRC if has('gui_running') | source $MYGVIMRC
endif

" :DeleteHideBufferで全ての隠れているバッファを削除する
function! s:delete_hide_buffer()
	let list = filter(range(1, bufnr("$")), "bufexists(v:val) && !buflisted(v:val)")
	for num in list
		execute "bw ".num
	endfor
endfunction
command! DeleteHideBuffer :call s:delete_hide_buffer()

" makeやgrepをした際に自動的にquickfixが開くようにする
autocmd QuickfixCmdPost make,grep,grepadd,vimgrep,vimgrepadd if len(getqflist()) != 0 | copen | endif

"""""""""" 言語ごとの設定 """"""""""
""""" PHP用設定 """"""""
" :makeでPHP構文チェック
au FileType php setlocal makeprg=php\ -l\ %
au FileType php setlocal errorformat=%m\ in\ %f\ on\ line\ %l
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

