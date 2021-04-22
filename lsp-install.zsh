#!/bin/zsh

# CSS
echo "\n Installing CSS server...\n"
npm install -g vscode-css-languageserver-bin

# Elixir
echo "\n Installing Elixir server...\n"
curl --show-error --location https://github.com/elixir-lsp/elixir-ls/releases/latest/download/elixir-ls.zip | tar xf - -C $HOME/.elixir-ls/release/
chmod u+x $HOME/.elixir-ls/release/language_server.sh

# Go
echo "\n Installing Go server...\n"
if which gopls > /dev/null 2>&1
then
  brew upgrade gopls
else
  brew install gopls
fi

# HTML
echo "\n Installing HTML server...\n"
npm install -g vscode-html-languageserver-bin

# JavaScript / TypeScript
echo "\n Installing TypeScript server...\n"
npm install -g typescript typescript-language-server

# JSON
echo "\n Installing JSON server...\n"
npm install -g vscode-json-languageserver

# Lua
echo "\n Installing Lua server...\n"
if which ninja > /dev/null 2>&1
then
  brew upgrade ninja
else
  brew install ninja
fi
rm -rf $HOME/.lua-ls
git clone https://github.com/sumneko/lua-language-server $HOME/.lua-ls
cd $HOME/.lua-ls
git submodule update --init --recursive
cd 3rd/luamake
compile/install.sh
cd ../..
./3rd/luamake/luamake rebuild

# Python
echo "\n Installing Python server...\n"
pip3 install python-language-server pyls-black

# Ruby
echo "\n Installing Ruby server...\n"
gem install --user-install solargraph

# YAML
echo "\n Installing YAML server...\n"
npm install -g yaml-language-server
