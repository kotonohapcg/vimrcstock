
set nocompatible
set cursorline
set cursorcolumn

set incsearch
set ttyfast
set showtabline=2

set fenc=utf-8
set nobomb
set nobackup
set noswapfile
set showcmd
set hidden

set backspace=indent,eol,start

"setting indent
set autoindent
set smartindent
set breakindent

"status line ever indicate
set laststatus=2
set autowrite

"setting copy & paste
set clipboard=unnamed,autoselect

"tab & other settings
set shiftwidth=4
set tabstop=4
set noexpandtab
set number
set title
set background=dark

"color terminal::
set t_Co=256

"color scheme setting::
colorscheme molokai


"use multibyte character setting
set ambiwidth=double


"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/kotonoha/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/kotonoha/.cache/dein')
  call dein#begin('/home/kotonoha/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/home/kotonoha/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
    call dein#add('itchyny/lightline.vim')
    call dein#add('othree/html5.vim')
	call dein#add('hail2u/vim-css3-syntax')
	call dein#add('jelera/vim-javascript-syntax')
	call dein#add('scrooloose/nerdtree')
	call dein#add('lordm/vim-browser-reload-linux')
	call dein#add('tyru/open-browser.vim')
	call dein#add('mattn/emmet-vim')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax on

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

