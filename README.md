# Nvim Config

## 1. Packer Install

git clone --depth 1 https://github.com/wbthomason/packer.nvim\
~/.local/share/nvim/site/pack/packer/start/packer.nvim

## 2. Installing Packages

`:PackerSync`

(may have to run multiple times)

## 3. Install dlv and add to path

`go install github.com/go-delve/delve/cmd/dlv@latest`

## 4. Install LSPs

`:Mason` and press `i` to install various packages e.g.

    - bash-language-server bashls
    - gopls
    - lua-language-server lua_ls
    - markdownlint
    - marksman
    - rust-analyzer rust_analyzer
    - typescript-language-server tsserver
