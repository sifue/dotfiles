if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  au BufNewFile,BufRead *.html    setlocal noexpandtab
  au BufNewFile,BufRead *.md    setlocal noexpandtab
  au BufNewFile,BufRead *.c    setlocal tabstop=4 shiftwidth=4
  au BufNewFile,BufRead *.cpp  setlocal tabstop=4 shiftwidth=4
  au BufNewFile,BufRead *.h    setlocal tabstop=4 shiftwidth=4
augroup END
