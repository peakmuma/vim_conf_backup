set nocompatible

set number "显示行号
set wildmenu "显示菜单提示

"matchit
filetype plugin on
runtime macros/matchit.vim

"syntax 
syntax enable
syntax on

"colortheme
set background=dark
colorscheme solarized

let g:Powerline_colorscheme='solarized256'

"hide Menu and Toolbar
set guioptions-=m
set guioptions-=T

"remove scroll bar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

"set tab width
filetype indent on " 自适应不同语言的智能缩进
set expandtab " 将制表符扩展为空格
set tabstop=4 " 设置编辑时制表符占用空格数
set shiftwidth=4 " 设置格式化时制表符占用空格数
set softtabstop=4 " 让 vim 把连续数量的空格视为一个制表符

" 基于缩进或语法进行代码折叠 
" 操作：za，打开或关闭当前折叠；zM，关闭所有折叠；zR，打开所有折叠
"set foldmethod=indent
set foldmethod=syntax
set nofoldenable	 " 启动 vim 时关闭折叠代码

set nowrap

"ctags
set tags=tags;
set autochdir

"set font family and size
set guifont=Consolas:h12:cANSI "set guifont=? and press the enter, vim display the current font

"set encoding
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
language messages zh_CN.utf-8

"set ignorecase and smartcase
set ignorecase "shortcut is 'set ic'
set smartcase

"vundle
filetype off                  " required
set rtp+=$VIM_HOME/vimfiles/bundle/Vundle.vim/
call vundle#begin('$VIM_HOME/vimfiles/bundle/')
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Lokaltog/vim-powerline'
call vundle#end()            " required
filetype plugin on    " required

"source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

