"###############################################################
"#  my init.vim for neovim                                     #
"#      >lastutpdate: 2019.02.20                               #
"#      >auther: Soichiro Yoshimura <yoshimura@soichiro.org>   #
"###############################################################
"VimをなるべくVi互換にする
set nocompatible

"カラースキーム
:color evening

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

" ハイライトを消す設定
nmap <Esc><Esc> :nohl<CR>

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

" スクロール時に余分なバッファを持ってスクロール
set scrolloff=16

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

" terminalのterminalモードからの復帰をESCでする
tnoremap <silent> <ESC> <C-\><C-n>

" cppファイルをF4でコンパイルする
autocmd filetype cpp nnoremap <F4> :split term://g++ % -std=gnu++1y -O2 -o %:r <CR>

" cppファイルをF5でコンパイルして実行までする
autocmd filetype cpp nnoremap <F5> :split term://g++ % -std=gnu++1y -O2 -o %:r ; ./%:r <CR>

" F6で実行だけする
autocmd filetype cpp nnoremap <F6> :split term://./%:r <CR>

" dein インストール
let $CACHE = expand('~/.cache')
if !isdirectory($CACHE)
  call mkdir($CACHE, 'p')
endif
if &runtimepath !~# '/dein.vim'
  let s:dein_dir = fnamemodify('dein.vim', ':p')
  if !isdirectory(s:dein_dir)
    let s:dein_dir = $CACHE . '/dein/repos/github.com/Shougo/dein.vim'
    if !isdirectory(s:dein_dir)
      execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
    endif
  endif
  execute 'set runtimepath^=' . substitute(
        \ fnamemodify(s:dein_dir, ':p') , '[/\\]$', '', '')
endif
"End dein Scripts-------------------------

" neosnippetsの設定
let g:neosnippet#snippets_directory='~/dotfiles/nvim/my_snippet'

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

" GitHub Copilot Settings
let g:copilot_node_command = '~/.nvm/versions/node/v18.13.0/bin/node'
