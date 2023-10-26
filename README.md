# vimrcstock
Vimに関すること

主に自分のvimrcをバックアップする目的で作りました．
基本的にVimを使うので，VirtualBoxやローカルインストールしたときに楽に環境構築するのが狙いです．現時点では主に以下のファイルが登録されています

### `init.vim`
- GVimからNeoVimに乗り換えており、そのための設定ファイルを記述したもの。プラグイン管理は`vim-plug`を利用。

`init.lua`
- nvimを使っているうちになんとなくluaに統一したかったので設定を移行。なおVSCode用のNeoVim拡張用にコードブロックを合わせているものの、そっち側のためになにかする予定は今のところなし。


`.vimrc`

- vim/gvim用

`.gvimrc`

- gvim固有の(ex.ウィンドウサイズなど)設定を書いたもの．

`forservervimrc`

- リネーム必須．server系用，但しVirtualBox向けに書いてるのでローカルでは動作しない可能性がある．現時点では.vimrcと特に変わりはない．

`myexrc`

- nocompatibleなりしたvim-tiny用だが空気．だが一応残す．

`README.md`

これ．

