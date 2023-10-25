
-- " ※※※※※※※※※※
-- " ※config keyword explain※
-- " ※※※※※※※※※※


--  バインド設定時の特殊構文などについて
--  <Silent> -> ステータスラインにメッセージを表示しない
--  <Leader> -> ユーザがrcファイルで設定したキーを使ってコマンドを打ち始めるときに使う
-- " " <hogehoge><CR> -> コマンドを置換した後、改行する(実行する)

-- vimscriptをそのまま持ってくる場合：
-- ワンライナーのとき: vim.cmd("")
-- 複数行にまたがるとき： vim.cmd [[ try <hogehogehoge> catch <sentence> endtry ]]

-- coc-symbol-lineとは別で設定が必要か？
-- vim.o.winbar = "%f"



-- VSCodeで動作しているか？

 if vim.g.vscode then
 	-- VSCode extensions configuration※



  
 else
-- Neovim固有の設定を記述する



  vim.opt.completeopt = menuone, noinsert
  -- グローバルステータスライン→3 (※require nvim up to 0.7.0)
  -- バッファ別ステータスライン→2
  vim.opt.laststatus = 3
  
  -- " ※※※※※※※※※※※※※
  -- " ※Experimental  config※
  -- " ※※※※※※※※※※※※※
  
  vim.opt.title = true
  vim.opt.scrolloff = 10
  
  -- 初回起動時に$HOMEに移動しておく(Windows)
  vim.cmd("cd ~\\")
  
  -- 初回起動時に$HOMEに移動しておく(Linux)
  -- vim.cmd("cd ~/")
  
  
  -- " ※※※※※※※※※※
  -- " ※Default   config※
  -- " ※※※※※※※※※※
  
  vim.g.nocompatible = true
  vim.g.cursorline = true
  vim.g.cursorcolumn = true
  vim.g.mouse = 'a'
  vim.g.noswapfile = true
  vim.opt.smartindent = true
  vim.opt.visualbell = true
  
  vim.opt.ignorecase = true
  vim.opt.smartcase = true
  vim.opt.wrapscan = true
  
  -- need settings for use Colorizer
  vim.opt.termguicolors = true
  
  vim.g.noexpandtab = true
  vim.g.tabstop = 8
  vim.g.softtabstop=2
  vim.g.shiftwidth = true
  
  -- タブ設定はTreeSitterとかで自動判定させた方が良いかもしれないが・・・
  
  
  -- ---
  
  -- clipboard config
  vim.opt.clipboard:append{'unnamedplus'}
  
  -- コマンド入力時のタイムアウト時間の設定(msec, neovim default = 1000msec)
  vim.o.ttimeout = true		-- if, 'false' is use default setting
  vim.o.timeoutlen = 500
  vim.o.ttimeoutlen = 600
  
  -- leader key mappings		-- default is '\'
  vim.g.mapleader = " "
  vim.g.maplocalleader = " "
  
  -- 行番号の相対表示と絶対表示の併用(どっちも'true')
  vim.opt.number = true
  vim.opt.relativenumber = true
  
  vim.opt.list = true
  
  -- 空白や改行などの可視化
  vim.cmd('set listchars=tab:>-,trail:*,eol:↲')
  -- neovimの場合は'double'よりも'single'の方が綺麗に(整って)表示される？
  vim.opt.ambiwidth = "single"
  
  -- Markdown, PHP, html or other filetype set command shortcut
  vim.keymap.set("c", "sefm", "set filetype=markdown")
  vim.keymap.set("c", "sefl", "set filetype=lua")
  vim.keymap.set("c", "sefh", "set filetype=html")
  vim.keymap.set("c", "sefp", "set filetype=php")
  
  -- Markdown code-block syntax highlighting
  vim.cmd("let g:markdown_fenced_languages = [ 'cpp', 'html', 'json', 'javascript', 'lua', 'php']")
  -- ``の間をハイライトする
  vim.cmd("autocmd Colorscheme * highlight link markdownCode Constant")
  
  
  -- coc.nvim config
  -- 候補確定を<CR>に変更する
  -- vim.cmd("imap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : '\<CR>'")
  
  -- <Tab>、<S-Tab>で変換候補を選択できるようにする
  -- vim.cmd("imap <expr> <Tab> coc#pum#next()? '\<C-n>' : '\<Tab>'")
  -- vim.cmd("inoremap <expr> <S-Tab> pumvisible() ? '\<C-p>' : '\<S-Tab>'")
  
  
  
  -- ※※※※※※※※※※
  -- ※※window move mappings※※
  -- ※※※※※※※※※※ 
  -- vim.keymap.set("n", "<C-t>", ":tabnew<CR>")
  
  
  -- ※※※※※※※※※※
  -- ※※tab config ※※
  -- ※※※※※※※※※※
  
  -- tab create / delete *require nvim-qt
  vim.keymap.set("n", "<C-t>", ":tabnew<CR>")
  vim.keymap.set("n", "<C-S-t>", ":tabc<CR>")
  
  -- tab move *require nvim-qt
  vim.keymap.set("n", "<C-Tab>", ":tabnext<CR>")
  vim.keymap.set("n", "<C-S-Tab>", ":tabprevious<CR>")
  
  -- buffer move
  vim.keymap.set("n", "<C-j>", ":bnext<CR>")
  vim.keymap.set("n", "<C-k>", ":bprev<CR>")
  
  
  -- move cursorline remap
  -- vim.keymap.set("n", "j", "gj")
  -- vim.keymap.set("n", "k", "gk")
  -- move cursorline remap to 'set relativenumber'  options
  -- !!PLEASE DISABLED NORMALMODE SWAP J AND GJ KEYMAPPING!! --
  vim.cmd("nnoremap <expr> j v:count ? 'j' : 'gj'")
  vim.cmd("nnoremap <expr> k v:count ? 'k' : 'gk'")
  
  
  
  -- vim.keymap.set
  vim.keymap.set("n", "<Esc><Esc>", ":nohlsearch<CR><Esc>")
  vim.keymap.set("n", "<C-w>n", "<Esc>:enew<Return>")
  vim.cmd("set whichwrap=b,s,<,>,[,]")
  
  -- need buffergator plugin
  -- Open buffergator mru list toggle
  vim.keymap.set("n", "<leader><C-b>", ":BuffergatorToggle<CR><Esc>")
  -- vim.cmd("g:buffergator_split_size = 2")
  
  
  -- Telescope shortcut map
  vim.keymap.set("n", "<C-f>", ":Telescope<CR>")
  
  -- View split Diff window
  vim.keymap.set("n", "<Leader><C-d>", ":diffthis<CR>")
  vim.keymap.set("n", "<Leader><C-S-d>", ":diffoff<CR>")
  
  -- completion window movekey is default to allow
  vim.cmd('imap <expr><C-n> pumvisible() ? "<Down>" : "<C-n>"')
  vim.cmd('imap <expr><C-p> pumvisible() ? "<Up>" : "<C-p>"')
  
  
  -- ToggleTerm use shortcut key
  --  set
  vim.cmd('autocmd TermEnter term://*toggleterm#* tnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>')
  
  vim.keymap.set("n", "<Leader><C-t>", ":ToggleTerm size=40 dir=./ direction=horizontal<CR>")
  -- vim.keymap.set("i", "<Leader><silent><C-t>", ":ToggleTerm size=40 dir=./ direction=horizontal<CR>")
  
  
  
  -- ※※※※※※※※※※
  -- ※※GUI config ※※
  -- ※※※※※※※※※※
  vim.cmd("set fileformats=dos,unix,mac")
  
  --  GUI font configuration
  --  Windowsの標準フォントで使用する場合
  -- vim.g.guifont = "BIZ\\ UDゴシック:h14"
  vim.g.guifont = "PlemolJP\\ Console\\ NFJ:h14"
  -- コマンド一発でGUIの文字のサイズを変更できるようにする　BIG= 20, Mid= 18, Small= 14
  -- 現状nvim-qtでのみ動作を確認済み。
  vim.cmd("cmap Big set guifont=PlemolJP\\ Console\\ NFJ:h20:cutf-8 guifontwide=PlemolJP\\ Console\\ NFJ:h20")
  vim.cmd("cmap Mid set guifont=PlemolJP\\ Console\\ NFJ:h18:cutf-8 guifontwide=PlemolJP\\ Console\\ NFJ:h18")
  vim.cmd("cmap Small set guifont=PlemolJP\\ Console\\ NFJ:h14:cutf-8 guifontwide=Plemol\\ Console\\ NFJ:h14")
  vim.cmd("cmap VSmall set guifont=PlemolJP\\ Console\\ NFJ:h12:cutf-8 guifontwide=Plemol\\ Console\\ NFJ:h12")
  
  
  
  vim.keymap.set('n','<C-e>',':Fern ~/ -reveal=% -drawer -toggle -width=30<CR>')
  
  
  -- ※※※※※※※※※※
  -- ※IME configuration※
  -- ※※※※※※※※※※
  
  -- ime off(spzenhanを使用する場合※要Plug Install)
  -- ※環境によっては動作しない可能性あり(Windows機3機で検証済)
  vim.cmd [[
  if executable('spzenhan')
  	let s:lastimestate = 0
  	autocmd InsertLeave * :call system('spzenhan 0')
  	" autocmd InsertLeave * s:call system('spzenhan 0')* :call system('spzenhan 0')
  	autocmd CmdlineLeave * :call system('spzenhan 0')
  	" 挿入モードに入ったときに、自動的にローマ字入力に出来ない…？
  	" 直前の挿入モードでの入力状態が保存できればいけそう
  	" autocmd InsertEnter * :call system('spzenhan ' + s:lastimestate)
  endif
  ]]
  
  
  
  
  -- colorscheme config
  -- vim.cmd [[
  -- try
  -- 	colorscheme duskfox
  -- 	set background=dark
  -- catch /^Vim\%((\a\+)\)\=:E185/
  -- 	colorscheme elflord
  -- 	set background=dark
  -- endtry
  -- ]]
  
  -- vim.cmd(colorscheme duskfox)
  -- vim.cmd(set backgroud = dark)
  
  
  
  vim.cmd("set fileencodings=utf-8,cp932,euc-jp")
  
  vim.g.showtabline = 2
  vim.g.noshowmode = true
  
  -- setup lazy.nvim
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
    })
  end
  vim.opt.rtp:prepend(lazypath)
  
  require("lazy").setup({
    "folke/which-key.nvim",
    "itchyny/lightline.vim",
    "kaz399/spzenhan.vim",		--Japanese IME Config
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",	-- fzf
    "LinArcX/telescope-command-palette.nvim",
    "vim-scripts/YankRing.vim",
    "jeetsukumaran/vim-buffergator",
    "nvim-treesitter/nvim-treesitter",	-- 要：POSIX環境orMSYS2などのUnix互換環境(※USBインストール不可？
    "NvChad/nvim-colorizer.lua",
    "mhinz/vim-startify",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-path",
    "lambdalisue/fern.vim" ,
    "tkmpypy/chowcho.nvim" ,
    -- LSP config
    -- "williamboman/nvim-lsp-installer",
    -- "neovim/nvim-lspconfig",
    -- "williamboman/mason.nvim",
    -- "williamboman/mason-lspconfig.nvim",
  
    -- use nvim on any textarea
    -- windows defenderでトロイの木馬判定される場合があるので注意
    "subnut/nvim-ghost.nvim",
    -- auto completion & LSP
    "neoclide/coc.nvim",
    {'akinsho/toggleterm.nvim', version = "*", config = true},
    -- "",
    -- "",
  
  
    "folke/tokyonight.nvim",		--colorscheme
    {
    	"EdenEast/nightfox.nvim",		--colorscheme
      lazy = false, -- make sure we load this during startup if it is your main colorscheme
      priority = 800, -- make sure to load this before all the other start plugins
      config = function()
        -- load the colorscheme here
        vim.cmd([[colorscheme carbonfox]])
      end,
    },
  
  })
  
  -- LSP config
  -- use coc.nvim
  --
  vim.cmd [[
  "" coc.nvim
  "" <Tab>で候補をナビゲート
  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
  endfunction
  
  inoremap <silent><expr> <Tab>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<Tab>" :
        \ coc#refresh()
  "" <Tab>で次、<S+Tab>で前
  inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
  inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
  
  "" coc用にバインドを拡張する
  
  
  
  
  ]]
  
  
  
  -- chowcho config
  -- reference :: https://zenn.dev/kawarimidoll/articles/daa39da5838567
  local chowcho = require('chowcho')
  
  -- <C-w>xと<C-w><C-x>を同時に設定する
  local win_keymap_set = function(key, callback)
    vim.keymap.set({ 'n', 't' }, '<C-w>' .. key, callback)
    vim.keymap.set({ 'n', 't' }, '<C-w><C-' .. key .. '>', callback)
  end
  
  win_keymap_set('w',
    function()
      local wins = 0
  
      -- 全ウィンドウをループ
      for i = 1, vim.fn.winnr('$') do
        local win_id = vim.fn.win_getid(i)
        local conf = vim.api.nvim_win_get_config(win_id)
  
        -- focusableなウィンドウをカウント
        if conf.focusable then
          wins = wins + 1
  
  	-- ウィンドウ数が3以上ならchowchoを起動
  	if wins > 2 then
            chowcho.run()
            return
          end
        end
      end
  
      -- ウィンドウが少なければ標準の<C-w><C-w>を実行
      vim.api.nvim_command('wincmd w')
    end
  )
  
  
  
  
  -- YankRing.vim config
  -- ヤンク履歴は~/yankring_history_v2に保存されている
  vim.cmd(':let g:yankring_max_history = 30')
  vim.cmd(':let g:yankring_max_display = 70')
  vim.cmd(':let g:yankring_ignore_duplicate = 0')
  
  -- Which Key config
  local wk = require("which-key")
  -- As an example, we will create the following mappings:
  --  * <leader>ff find files
  --  * <leader>fr show recent files
  --  * <leader>fb Foobar
  -- we'll document:
  --  * <leader>fn new file
  --  * <leader>fe edit file
  -- and hide <leader>1
  
  wk.register({
    f = {
      name = "file", -- optional group name
      f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
      r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File", noremap=false, buffer = 123 }, -- additional options for creating the keymap
      n = { "New File" }, -- just a label. don't create any mapping
      e = "Edit File", -- same as above
      ["1"] = "which_key_ignore",  -- special label to hide it in the popup
      b = { function() print("bar") end, "Foobar" } -- you can also pass functions!
    },
  }, { prefix = "<leader>" })
  
  
  -- neotree configs
  -- vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
  
  
  -- cmp-path config
  -- require'cmp'.setup{
  --   sources = {
  -- 	{
  -- 		name ='path',
  -- 		option = {
  -- 			label_trailing_slash = true
  -- 		}
  -- 	}
  --   }
  -- }
  
  --[[
  
  "open-browser.vim settings
  let g:netrw_nogx = 1 " disable netrw's gx mapping.
  nmap gx <Plug>(openbrowser-smart-search)
  vmap gx <Plug>(openbrowser-smart-search)
  
  
  "auto-pairs config
  vim.cmd [[
  " let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', '`':'`', '<':'>'}
  
  " '<!--','-->'なんかを自動で入力されるようにしたい　※未検証、おそらく動作はしない
  " au FileType html let b:AutoPairs = AutoPairsDefine({'<!--':'-->'})
  " au FileType php let b:AutoPairs = AutoPairsDefine({'<?' : '?>', '<?php' : '?>'})
  
  ]]
  
end