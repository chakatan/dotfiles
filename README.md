# DotFiles
個人用ドットファイルです。

## 概要
大昔に作ったの復活させて手探りで新しくしたのでグチャグチャです。
vimとneovimを共存させてます。

## 手動インストール手順
自動化できてないインストールのメモ

### neovim最新インストール
``` zsh 
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
chmod u+x nvim-linux-x86_64.appimage
mv nvim-linux-x86_64.appimage ~/app
```

### elixir 最新インストール
``` zsh
git clone https://github.com/asdf-vm/asdf.git ~/.asdf
asdf install erlang latest
asdf install elixir latest
```

### elixir-ls 
``` zsh
git clone https://github.com/elixir-lsp/elixir-ls.git ~/.elixir-ls
cd ~/.elixir-ls
mix deps.get
MIX_ENV=prod mix compile
MIX_ENV=prod mix elixir_ls.release2 -o release
```
