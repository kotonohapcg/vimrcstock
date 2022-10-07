filetype plugin indent off

" ※※※※※※※※※※
" ※Default   config※
" ※※※※※※※※※※

cd ~\
set wildmenu
set wildmode=full
set wildoption=pum
set pumblend=10

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
" Windowsの標準フォントで使用する場合
" set guifont=BIZ\ UDゴシック:h14
" ファイルマネージャをfernで使用する場合に、nerdfont対応の白源を使用する場合
set guifont=HackGen\ Console\ NFJ:h14

" コマンド一発でGUIの文字のサイズを変更できるようにする　BIG= 20, Mid= 18, Small= 14
" ※※動作不安定につき、たびたびの利用はお勧めしない※※
cmap Big set guifont=HackGen\ Console\ NFJ:h20:cutf-8 guifontwide=HackGen\ Console\ NFJ:h20
cmap Mid set guifont=HackGen\ Console\ NFJ:h18:cutf-8 guifontwide=HackGen\ Console\ NFJ:h18
cmap Small set guifont=HackGen\ Console\ NFJ:h14:cutf-8 guifontwide=HackGen\ Console\ NFJ:h14


" Markdown code-block syntax highlighting
let g:markdown_fenced_languages = [ 'cpp', 'html', 'json', 'javascript', 'lua', 'php']
" ``の間をハイライトする
autocmd Colorscheme * highlight link markdownCode Constant

" keymap config without plugin keymap
" leader key mapping
" 設定したキーは<Leader>で使用する
let mapleader = '\'




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


" ime off(spzenhanを使用する場合※要Plug Install)
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
" ※※※タブ設定※※※
" ※※※※※※※※※※

" ブラウザと同じような操作方法でタブ切り替えをする
" もしもこれが動かない場合は、<C-j/k>によるタブ切り替えを行う。その場合はバッファ切り替えのコマンドを別のバインドに変更すること。
" 現状ではnvim-qtで動作確認済み
nmap <C-Tab> :tabnext<CR>
nmap <C-S-Tab> :tabprevious<CR>
" nmap <C-j> :tabnext<CR>
" nmap <C-k> :tabprevious<CR>

" バッファ送り/戻しをする
nmap <C-j> :bnext<CR>
nmap <C-k> :bprev<CR>

" 新しいタブを開く/現在のタブを閉じる
" C-S-tについては、環境によって動作する場合とそうでない場合とがある模様
nmap <C-t> :tabnew<CR>
nmap <C-S-t> :tabc<CR>



" ※※※※※※※※※※
" ※Plugin configuration※
" ※※※※※※※※※※

"NERDTree settings
" 最初のタブはユーザの$HOMEを表示させる
" autocmd vimenter * if !argc() | NERDTree C:\Users\k_sat | endif
" " 次に:tabnewした場合は、デフォルトの位置を$HOMEに移動させる
" " autocmd TabNew * if !argc() | NERDTree ~/ | endif
" " 最後のタブになった場合の挙動(あんまり覚えていない)
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" " nnoremap <silent><C-e> :NERDTreeToggle C:\Users\k_sat<CR>
" nnoremap <silent><C-e> :NERDTreeToggle<CR>
" let NERDTreeShowHidden = 1

" Fern.vim configuration
" 隠しファイルを表示する
let g:fern#default_hidden=1
" Fern . を<Leader>+eに置き換え
" nmap <Silent> <Leader>e : <C-u>Fern .<CR>

" 最初のタブはユーザの$HOMEを表示させる
" autocmd vimenter * if !argc() | Fern C:\Users\k_sat -drawer -toggle | endif

" <C-e>でドロワー表示の切り替え
 nmap <C-e> :Fern . -reveal=% -drawer -toggle -width=40<CR>
" nmap <C-e> :Fern . -reveal=% -toggle<CR>


" フォント/アイコンの設定
" ※要nerdfont
let g:fern#renderer = 'nerdfont'





" Buffergator config
nmap <Leader><C-b> : BuffergatorToggle<CR>


"lightline-vim settings
let g:lightline = {
	\ 'colorscheme': 'powerline',
\ }


"open-browser.vim settings
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

" YankRing.vim config
:let g:yankring_max_history = 30
:let g:yankring_max_display = 70
:let g:yankring_ignore_duplicate = 0

" coc.nvim config
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
nmap <C-f> :CocList<CR>



"auto-pairs config
" <>を自動入力されるようにしたかったけど、ほかと同じ書式ではうまくいかないらしい。実装の問題か？
let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', '`':'`', '<':'>', '<?':'?>'}


" '<!--','-->'なんかを自動で入力されるようにしたい　※未検証、おそらく動作はしない
au FileType html	let b:AutoPairs = AutoPairsDefine({'<!--':'-->'})
au FileType php		let b:AutoPairs = AutoPairsDefine({'<?' : '?>', '<?php' : '?>'})


" vim-plug package manager config

call plug#begin('~/.config/nvim/plugged')

	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	
	" filler plugin
	Plug 'lambdalisue/fern.vim'
	Plug 'preservim/nerdtree'
	" statusline plugin
 	Plug 'itchyny/lightline.vim'

	Plug 'tyru/open-browser.vim'

	" IME plugin
	Plug 'kaz399/spzenhan.vim'

	" color scheme
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
	" Plug 'fmoralesc/vim-pad'
	" buffer finder
	Plug 'jeetsukumaran/vim-buffergator'

	" auto pair insert
	Plug 'jiangmiao/auto-pairs',

	" Nerd Font
	Plug 'lambdalisue/fern-renderer-nerdfont.vim'
	Plug 'lambdalisue/nerdfont.vim'
	" インデントのタブをRAINBOWにする
	Plug 'adi/vim-indent-rainbow'

call plug#end()

filetype plugin indent on
