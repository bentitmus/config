function! PackInit() abort
  packadd minpac

  call minpac#init()
  " Install with opt so it can be added with packadd
  call minpac#add('k-takata/minpac', {'type': 'opt'})
  " Install netrw otherwise vim won't find it on the packpath
  call minpac#add('vim-scripts/netrw.vim', {'type': 'opt', 'name': 'netrw'})

  " Packages
  call minpac#add('vhda/verilog_systemverilog.vim')
  call minpac#add('itchyny/lightline.vim')
  call minpac#add('vim-scripts/ShowTrailingWhitespace')
  call minpac#add('blueyed/vim-diminactive')
  call minpac#add('ianchanning/vim-selenized')
  call minpac#add('elihunter173/vim-rpl')
  call minpac#add('vito-c/jq.vim')
  "call minpac#add('tpope/vim-surround')
  "call minpac#add('tpope/vim-fugitive')
  "call minpac#add('drmingdrmer/xptemplate')
  "call minpac#add('ervandew/screen')
  "call minpac#add('sjl/gundo.vim')
  "call minpac#add('szw/vim-ctrlspace')
  "call minpac#add('kien/ctrlp.vim')
  "call minpac#add('vimtaku/hl_matchit.vim')
  "call minpac#add('universal-ctags/ctags')
  "call minpac#add('majutsushi/tagbar')
endfunction

command! PackUpdate source $XDG_CONFIG_HOME/vim/vimrc | call PackInit() | call minpac#update()
command! PackClean  source $XDG_CONFIG_HOME/vim/vimrc | call PackInit() | call minpac#clean()
command! PackStatus packadd minpac | call minpac#status()

