filetype plugin indent off

set nocompatible
set cursorline
set cursorcolumn

set mouse=a
colorscheme molokai
set background=dark

set fileformats=dos,unix,mac

set termguicolors
" let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
" let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"


set fileencodings=utf-8,cp932,euc-jp

set ambiwidth=double
set noswapfile

set clipboard+=unnamedplus

set number
set list
set listchars=tab:>-,trail:*,eol:↲
set smartindent
set visualbell

nmap j gj
nmap k gk

set noexpandtab
set tabstop=4
set shiftwidth=4

set ignorecase
set smartcase
set wrapscan

nmap <Esc><Esc> :nohlsearch<CR><Esc>

set whichwrap=b,s,<,>,[,]


nmap <C-w>n <Esc>:enew<Return>

set showtabline=2
set noshowmode

" GUI font configuration
set guifont=BIZ\ UDゴシック:h14

" tabby setup
" require("tabby").setup({
"     tabline = require("tabby.presets").tab_with_top_win,
" })

" Markdown code-block syntax highlighting
let g:markdown_fenced_languages = [ 'cpp', 'html', 'json', 'javascript', 'lua', 'php']
" ``の間をハイライトする
autocmd Colorscheme * highlight link markdownCode Constant


" leader key mapping
let mapleader = '\'


" YankRing.vim config
:let g:yankring_max_history = 30
:let g:yankring_max_display = 70
:let g:yankring_ignore_duplicate = 0


" ※※※※※※※※※※
" ※IME configuration※
" ※※※※※※※※※※
"
" let s:lastiminsert = 0
 " IMEの状態を保持しておく、置換モードではIMEの状態を保持しない
 " 置換モードではIMEの状態を保持しない。置換モードではIMEオフなので、置換モード後の挿入モードが常にIMEオフになることを避ける
" autocmd vimrc InsertLeave * if v:insertmode !=# 'r' | let s:lastiminsert = &iminsert | set iminsert=0 | endif
 " IMEの状態を復帰する。改行時には続けてIMEオンのままにしたいため。
 " 挿入モード（IMEオン）→ノーマルモード→挿入モード（IMEオン） となるが。これはむしろできなくていい
 " 置換モードではIMEの状態を復帰しない
" autocmd vimrc InsertEnter * if v:insertmode ==# 'i' | let &iminsert = s:lastiminsert | endif

"  control IME for modemap
"  **need install spzenhan plugin**
"  let g:spzenhan#executable=$runtimepath\share\pack\dist\start\spzenhan.vim-master\zenhan
"  let g:spzenhan#default_status = 0


" ime off
if executable('spzenhan')
	let s:lastimestate = 0
	autocmd InsertLeave * :call system('spzenhan 0')
	" autocmd InsertLeave * s:call system('spzenhan 0')* :call system('spzenhan 0')
	autocmd CmdlineLeave * :call system('spzenhan 0')
	" 挿入モードに入ったときに、自動的にローマ字入力に出来ない…？
	" 直前の挿入モードでの入力状態が保存できればいけそう
	" autocmd InsertEnter * :call system('spzenhan ' + s:lastimestate)
endif


" ※※※※※※※※※※
" ※Plugin configuration※
" ※※※※※※※※※※

"NERDTree settings
" 最初のタブはユーザの$HOMEを表示させる
autocmd vimenter * if !argc() | NERDTree C:\Users\k_sat | endif
" 次に:tabnewした場合は、デフォルトの位置を$HOMEに移動させる
" autocmd TabNew * if !argc() | NERDTree ~/ | endif
" 最後のタブ担った場合の挙動(あんまり覚えていない)
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" nnoremap <silent><C-e> :NERDTreeToggle C:\Users\k_sat<CR>
nnoremap <silent><C-e> :NERDTreeToggle<CR>

" タブ設定

" ブラウザと同じような操作方法でタブ切り替えをする
" もしもこれが動かない場合は、<C-j/k>によるタブ切り替えを行う。その場合はバッファ切り替えのコマンドを別のバインドに変更すること。
" 現状ではnvim-qtで動作確認済み
nmap <C-Tab> :tabnext<CR>
nmap <C-S-Tab> :tabprevious<CR>
" nmap <C-j> :tabnext<CR>
" nmap <C-k> :tabprevious<CR>

" バッファ送り/戻しをする
nmap <C-j> :bn<CR>
nmap <C-k> :bp<CR>

" 新しいタブを開く/現在のタブを閉じる
nmap <C-t> :tabnew<CR>
nmap <C-S-t> :tabc<CR>

let NERDTreeShowHidden = 1

"lightline-vim settings
let g:lightline = {
	\ 'colorscheme': 'powerline',
\ }


"open-browser.vim settings
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

" vim-plug package manager config

call plug#begin('~/AppData/Local/nvim/plugged')

	Plug 'neoclide/coc.nvim', {'branch': 'release'}

	Plug 'preservim/nerdtree'
 	Plug 'itchyny/lightline.vim'
	Plug 'tyru/open-browser.vim'
	Plug 'kaz399/spzenhan.vim'
	Plug 'tomasr/molokai'
	" Plug 'iamcco/markdown-preview.nvim'
	" fzf 
	" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	" require telescope
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim'
	Plug "LinArcX/telescope-command-palette.nvim"
	" translation vimdoc to japanese
	Plug 'vim-jp/vimdoc-ja'
	" Plug 'nanozuki/tabby.nvim'
	" OSのクリップボードとヤンク履歴を連動させて、<Super>+Vと同じ動作をさせる
	Plug 'vim-scripts/YankRing.vim'
	" notetaking plugin
	Plug 'fmoralesc/vim-pad'

call plug#end()

filetype plugin indent on
