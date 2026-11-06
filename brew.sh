#!/usr/bin/env bash
set -euo pipefail

if ! command -v brew >/dev/null 2>&1; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

xcode-select -p >/dev/null 2>&1 || xcode-select --install

brew install --HEAD neovim || true

brew install \
  ripgrep \
  fd \
  prettier \
  tree-sitter-cli \
  oxlint \
  rust
