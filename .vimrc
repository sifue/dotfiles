"###############################################################
"# My vimrc                                                    #
"#      >lastutpdate: 2017.06.16                               #
"#      >auther: Soichiro Yoshimura <yoshimura@soichiro.org>   #
"###############################################################
"VimをなるべくVi互換にする
set nocompatible

""""""""""" メモ """""""""""{{{
" 現在のファイルとのvimdiff
" :vertical diffsplit {差分を見たい対象ファイル名}
"
" タブを2スペースに置き換える
" :set expandtab
" :set ts=2
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

" 新しい行を開始したときに、新しい行のインデントを現在行と同じ量にする
set autoindent

" 検索で小文字なら大文字を無視、大文字なら無視しない設定
set smartcase

" (no)検索をファイルの末尾まで検索したら、ファイルの先頭へループする
set nowrapscan

" インクリメンタルサーチを行う
set incsearch

" highlight matches with last search pattern
set hlsearch

" 閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch

" カーソルが何行目の何列目に置かれているかを表示する
set ruler

" 新しい行を作ったときに高度な自動インデントを行う
set smartindent

" 保存しないで他のファイルを表示することが出来るようにする
set hidden

" カレントバッファ内のファイルの文字エンコーディングを設定する
set fileencoding=utf-8

" Insertモードで<Tab> を挿入するのに、適切な数の空白を使う
set expandtab
set ts=2
au BufNewFile,BufRead *.txt setlocal noexpandtab

" ファイル内の <Tab> が対応する空白の数
set tabstop=2

" 自動インデントの各段階に使われる空白の数
set shiftwidth=2

" 行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする
"set smarttab

" 強調表示(色付け)のON/OFF設定
syntax on

" ステータスラインを表示するウィンドウを設定する
" 2:常にステータスラインを表示する
set laststatus=2

" ステータス行の表示内容を設定する
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}G8%=%l,%c%V%8P

" vimのバックアップファイルとスワップファイル
set nobackup
set noswapfile
set noundofile

" バッファをクリップボードにコピー(for OSX)
set clipboard=unnamed,autoselect

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

" txtを自動改行しない
autocmd FileType text setlocal textwidth=0

"}}}
""""""""""" プラグイン """""""""""{{{
" プラグインマネージャー
" https://github.com/junegunn/vim-plug
" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

Plug 'justmao945/vim-clang'

" Initialize plugin system
call plug#end()
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

" vimrcの新しいタブでの編集と読み込みのショートカット設定
nnoremap ;s :source $MYVIMRC<CR>
nnoremap ;v :tabe $MYVIMRC<CR>
nnoremap ;g :tabe $MYGVIMRC<CR>
nnoremap ;l :tabe ~/.vimrc.local<CR>

" :makeや:grepをした際に自動的にquickfixが開くようにする
autocmd QuickfixCmdPost make,grep,grepadd,vimgrep,vimgrepadd if len(getqflist()) != 0 | cw | endif

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

" ファイルを開いたときに前回の編集箇所に移動
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

"}}}

""""""""""" ローカルの設定があれば読み込 み """"""""""""{{{
if filereadable(expand('~/.vimrc.local'))
    source ~/.vimrc.local
endif
"}}}
