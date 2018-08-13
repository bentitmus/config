command! PackUpdate packadd minpac | source $XDG_CONFIG_HOME/vim/vimrc | redraw | call minpac#update()
command! PackClean  packadd minpac | source $XDG_CONFIG_HOME/vim/vimrc | call minpac#clean()

if !exists('*minpac#init')
  finish
endif

call minpac#init()

call minpac#add('k-takata/minpac', {'type': 'opt'})
call minpac#add('chriskempson/base16-vim')
call minpac#add('vhda/verilog_systemverilog.vim')
"call minpac#add('altercation/vim-colors-solarized')
"call minpac#add('vim-airline/vim-airline')
"call minpac#add('vim-airline/vim-airline-themes')
"call minpac#add('verilog_systemverilog_fix')
"call minpac#add('tpope/vim-surround')
"call minpac#add('tpope/vim-fugitive')
"call minpac#add('drmingdrmer/xptemplate')
"call minpac#add('ervandew/screen')
"call minpac#add('sjl/gundo.vim')
"call minpac#add('szw/vim-ctrlspace')
"call minpac#add('kien/ctrlp.vim')
"call minpac#add('ShowTrailingWhitespace')
"call minpac#add('vimtaku/hl_matchit.vim')
"call minpac#add('universal-ctags/ctags')
"call minpac#add('majutsushi/tagbar')

