" .vimrc configuration file for Vim

set runtimepath+=/Users/ben/.vim/mpc

" Set-up plugins
call plug#begin('~/.vim/plugged')
  Plug 'altercation/vim-colors-solarized'
"  Plug 'vim-airline/vim-airline'
"  Plug 'vim-airline/vim-airline-themes'
  Plug 'vhda/verilog_systemverilog.vim'
call plug#end()

filetype plugin indent on

" Solarized setup
syntax enable
set background=dark
colorscheme solarized
" Use 256 colour emulation, rather than the 16-bit colours (the preferred
" method)
let g:solarized_termcolors=256
set t_Co=256 " Tell Vim that the terminal supports 256 colours

" Airline options
set encoding=utf-8 " For Unicode glyphs
let g:airline_theme='solarized'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'

" Functions
" Preserve cursor position and search history while performing a command
function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

" Execute a macro over a visual range
function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal! @".nr2char(getchar())
endfunction

" Key mappings
" Strip trailing whitespace
nnoremap _$ :call Preserve("%s/\\s\\+$//e")<CR>
" Normalise indentation in file
nnoremap _= :call Preserve("normal! gg=G")<CR>
" Allow dots over a visual range
xnoremap . :normal! .<CR>
" Allow macros over a visual range
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

" Global options
set tabstop=2       " Treat a tab as 2 spaces
set shiftwidth=2    " Indent uses 2 spaces
set softtabstop=2   " Operations treat tab as 2 spaces
set expandtab       " Replace tabs with spaces
set noerrorbells    " Do not ring the bell
set hidden          " Allow buffers to be hidden when they have pending changes
set number          " Show line numbers
set list            " Show hidden characters
set listchars=tab:▸\ ,eol:¬ " Set the symbols for hidden characters

" Filetype specific options
augroup vimrc
  autocmd!
  autocmd FileType make setlocal noexpandtab
  autocmd BufNewFile,BufRead *.svh set filetype=verilog_systemverilog
augroup END

