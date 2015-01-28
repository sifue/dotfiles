"###############################################################
"# My vimrc for Windows                                        #
"#      >lastutpdate: 2015.01.28                               #
"#      >auther: Soichiro Yoshimura <yoshimura@soichiro.org>   #
"###############################################################

"Vim���Ȃ�ׂ�Vi�݊��ɂ���
set nocompatible

" �J�����g�f�B���N�g���ݒ�
cd C:\Users\soichiro

"Windows�N���b�v�{�[�h�̋��L
set clipboard=unnamed

" Unite-Vim�̃C���X�g�[�����@
"cd C:\Apps\vim74-kaoriya-win64\plugins
"git clone git@github.com:Shougo/unite.vim.git
"git clone git@github.com:Shougo/neomru.vim

" Markdown�p�̃v���O�C���̃C���X�g�[�����@
"cd C:\Apps\vim74-kaoriya-win64\plugins
"git clone git@github.com:godlygeek/tabular
"git clone git@github.com:plasticboy/vim-markdown

""""""""""" �v���O�C�����Ƃ̐ݒ� """""""""""{{{�@
" Unite�N�����ɃC���T�[�g���[�h�ŊJ�n
" let g:unite_enable_start_insert = 1

" Unite�̊e��V���[�g�J�b�g�ݒ�
" �o�b�t�@�ꗗ
nnoremap <silent> ;ub :<C-u>Unite buffer<CR>
" �t�@�C���ꗗ
nnoremap <silent> ;uf :<C-u>Unite file buffer<CR>
" ���W�X�^�ꗗ
nnoremap <silent> ;ur :<C-u>Unite register<CR>
" �ŋߎg�p�����t�@�C���ꗗ
nnoremap <silent> ;um :<C-u>Unite file_mru<CR>

" markdown�̃V���^�N�X�n�C���C�g�ɂ����ăf�t�H���g�̐܂肽���݂��Ȃ��ɂ���
let g:vim_markdown_folding_disabled=1

"}}}

""""""""""" Vim�̊�{�I�Ȑݒ�  """""""""""{{{�@
" �o�b�N�X�y�[�X�L�[�̓�������肷��
" 2:indent,eol,start�Ɠ���
set backspace=2

" �s���\��
set number

" �V�����s���J�n�����Ƃ��ɁA�V�����s�̃C���f���g�����ݍs�Ɠ����ʂɂ���
set autoindent

" �����ŏ������Ȃ�啶���𖳎��A�啶���Ȃ疳�����Ȃ��ݒ�
set smartcase

" (no)�������t�@�C���̖����܂Ō���������A�t�@�C���̐擪�փ��[�v����
set nowrapscan

" �C���N�������^���T�[�`���s��
set incsearch

" highlight matches with last search pattern
set hlsearch

" �����ʂ����͂��ꂽ�Ƃ��A�Ή����銇�ʂ�\������
set showmatch

" �J�[�\�������s�ڂ̉���ڂɒu����Ă��邩��\������
set ruler

" �V�����s��������Ƃ��ɍ��x�Ȏ����C���f���g���s��
set smartindent

" �ۑ����Ȃ��ő��̃t�@�C����\�����邱�Ƃ��o����悤�ɂ���
set hidden

" Insert���[�h��<Tab> ��}������̂ɁA�K�؂Ȑ��̋󔒂��g��
set expandtab
set ts=4

" �t�@�C������ <Tab> ���Ή�����󔒂̐�
set tabstop=4

" �����C���f���g�̊e�i�K�Ɏg����󔒂̐�
set shiftwidth=4

" �s���̗]������ Tab ��ł����ނƁA'shiftwidth' �̐������C���f���g����
"set smarttab

" �����\��(�F�t��)��ON/OFF�ݒ�
syntax on

"�o�b�N�X�y�[�X���g����悤�ɂ���
set backspace=start,eol,indent

" �X�e�[�^�X���C����\������E�B���h�E��ݒ肷��
" 2:��ɃX�e�[�^�X���C����\������
set laststatus=2

" �X�e�[�^�X�s�̕\�����e��ݒ肷��
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}G8%=%l,%c%V%8P

" vim�̃o�b�N�A�b�v�t�@�C���ƃX���b�v�t�@�C��
set nobackup
set noswapfile
set noundofile

"�������s�I�t
set tw=0

" �}�E�X���[�h�L��
set mouse=a

" UTF-8���������Ή�
set termencoding=utf-8
"set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,cp932

" 256�F�Ή�
set t_Co=256

"}}}


""""""""""" ������UP�̂��߂̐ݒ� """""""""""{{{
" <Leader>��\�Ƀ��}�b�b�v
nnoremap \ <Leader>
vnoremap \ <Leader>

"�R�����g�A�E�g���A�����ē��͂����̂��֎~ :a!�ł���p��
autocmd FileType * setlocal formatoptions-=ro

"�S�p�X�y�[�X���@�ŕ\��
highlight JpSpace cterm=underline ctermfg=Blue guifg=Blue
au BufRead,BufNew * match JpSpace /�@/

"�^�u��������悤�ɐݒ�
set list
set listchars=tab:>-,trail:-

" �T�[�`�n�C���C�g����ESC���ŏ���
nnoremap <Esc><Esc> :nohlsearch<CR><Esc>

" �}�����[�h�ƃm�[�}�����[�h�ŃX�e�[�^�X���C���̐F��ύX����
au InsertEnter * hi StatusLine guifg=DarkBlue guibg=DarkYellow gui=none ctermfg=Blue ctermbg=Yellow cterm=none
au InsertLeave * hi StatusLine guifg=Black guibg=White gui=none ctermfg=Black ctermbg=White cterm=none

"�o�C�i���ҏW(xxd)���[�h�ivim -b �ł̋N���A�������� *.bin �Ŕ������܂��j
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

" ���B�W���A�����[�h�őI�������e�L�X�g��n�Ō�������(���W�X�^v�g�p)
vnoremap <silent> n "vy/\V<C-r>=substitute(escape(@v,'\/'),"\n",'\\n','g')<CR><CR>

" gf�ŃJ�[�\�����̃t�@�C������V�����^�u�ŊJ��
nnoremap gf :tabe <cfile><CR>
vnoremap gf :tabe <cfile><CR>

" �����ꂪ��ʒ����ɂ���悤��
nmap n nzz
nmap N Nzz

" Ctrl + Shift + u �őI�������P������݂̃t�@�C������grep (���W�X�^u�g�p)
vnoremap <silent> <C-S-u> "uy:vimgrep /<C-r>u/ <C-r>%<CR>:copen<CR>gv=gv

" �����N�A�؂��莞�Ƀ��W�X�^"�̒l��z�ɂ��R�s�[���Ă���(�A���\�t�Ɏg��)
vnoremap <silent> y y:let @z=@"<CR>
vnoremap <silent> d d:let @z=@"<CR>

" �r�W���A�����[�h�őI�������e�L�X�g�������ă��W�X�^z�̓��e��\�t����(�A���\�t��)
vnoremap <silent> p x"zP

" vimrc�̐V�����^�u�ł̕ҏW�Ɠǂݍ��݂̃V���[�g�J�b�g�ݒ�
nnoremap ;s :source $MYVIMRC<CR>
nnoremap ;v :tabe $MYVIMRC<CR>
nnoremap ;g :tabe $MYGVIMRC<CR>
nnoremap ;l :tabe ~/.vimrc.local<CR>

" :make��:grep�������ۂɎ����I��quickfix���J���悤�ɂ���
autocmd QuickfixCmdPost make,grep,grepadd,vimgrep,vimgrepadd if len(getqflist()) != 0 | cw | endif

" UNC�p�X����smb��URL�ɕύX����(:SMBfromUNC)
function! SMBfromUNC()
  %s/\\\\/smb:\/\//g
  %s/\\/\//g
  echo "Convert from UNC."
endfunction
command! SMBfromUNC :call SMBfromUNC()

" smb��URL����UNC�p�X�ɕύX����(:SMBtoUNC)
function! SMBtoUNC()
  %s/smb:\/\//\\\\/g
  %s/\//\\/g
  echo "Convert to UNC."
endfunction
command! SMBtoUNC :call SMBtoUNC()

" �t�@�C�����J�����Ƃ��ɑO��̕ҏW�ӏ��Ɉړ�
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif


"}}}
