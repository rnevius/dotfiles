#!/bin/zsh

# CSS
npm install -g vscode-css-languageserver-bin

# HTML
npm install -g vscode-html-languageserver-bin

# JavaScript / TypeScript
npm install -g typescript typescript-language-server

# JSON
npm install -g vscode-json-languageserver

# Elixir
curl --show-error --location https://github.com/elixir-lsp/elixir-ls/releases/latest/download/elixir-ls.zip | tar xf - -C $HOME/.elixir-ls/release/

# Ruby
gem install --user-install solargraph

# YAML
npm install -g yaml-language-server
