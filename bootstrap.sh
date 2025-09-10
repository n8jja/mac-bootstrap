#!/usr/bin/env bash

set -euo pipefail # safer bash script

echo "🔧 Starting Mac bootstrap setup..."

### --- Homebrew ---
if ! command -v brew &>/dev/null; then
  echo "🍺 Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "🍺 Homebrew already installed"
fi

### --- Run Brewfile installs ---
DOTFILES_DIR="$HOME/mac-bootstrap"
if [[ -f "$DOTFILES_DIR/Brewfile" ]]; then
  echo "📦 Installing from Brewfile..."
  brew tap azure/functions
  brew tap hashicorp/tap
  brew tap microsoft/mssql-release
  brew tap tabbyml/tabby
  brew bundle --file="$DOTFILES_DIR/Brewfile"
else
  echo "⚠️ Brewfile not found in $DOTFILES_DIR"
fi

### --- Oh My Zsh ---
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
  echo "💻 Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
  echo "💻 Oh My Zsh already installed"
fi

### --- Powerlevel10k ---
if [[ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]]; then
  echo "🎨 Installing Powerlevel10k..."
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
    ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi

### --- Zsh Plugins ---
PLUGINS_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins"

if [[ ! -d "$PLUGINS_DIR/zsh-autosuggestions" ]]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions "$PLUGINS_DIR/zsh-autosuggestions"
fi
if [[ ! -d "$PLUGINS_DIR/zsh-syntax-highlighting" ]]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$PLUGINS_DIR/zsh-syntax-highlighting"
fi

### --- Rust Dev Tools ---
if command -v cargo &>/dev/null; then
  cargo install cargo-edit --quiet || true
  cargo install cargo-watch --quiet || true
  cargo install cargo-audit --quiet || true
  cargo install cargo-outdated --quiet || true
fi

### --- Go Dev Tools ---
if command -v go &>/dev/null; then
  export GOPATH="$HOME/go"
  export PATH="$GOPATH/bin:/usr/local/go/bin:$PATH"

  go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
  go install github.com/go-delve/delve/cmd/dlv@latest
  go install github.com/rakyll/hey@latest
  go install honnef.co/go/tools/cmd/staticcheck@latest
fi

### --- .NET Workloads ---
if command -v dotnet &>/dev/null; then
  dotnet workload install wasm-tools
  dotnet workload install maui
  dotnet workload install android
  dotnet workload install ios
fi

### --- TypeScript ---
if command -v npm &>/dev/null; then
  npm install -g typescript ts-node eslint
fi

echo ""
echo "🔍 Running post-install verification..."

# Rust
command -v rustc && echo "🦀 Rust: $(rustc --version)"
command -v cargo && echo "   Cargo: $(cargo --version)"
command -v rustup && echo "   Rustup: $(rustup --version)"

# Go
command -v go && echo "🐹 Go: $(go version)"
command -v golangci-lint && echo "   ✅ golangci-lint"
command -v dlv && echo "   ✅ delve"
command -v hey && echo "   ✅ hey"
command -v staticcheck && echo "   ✅ staticcheck"

# Python
command -v python3.11 && echo "🐍 Python 3.11: $(python3.11 --version)"
command -v python3.12 && echo "🐍 Python 3.12: $(python3.12 --version)"
command -v python3.13 && echo "🐍 Python 3.13: $(python3.13 --version)"

# Terraform / tooling
command -v terraform && echo "☁️ Terraform: $(terraform version | head -n 1)"
command -v opentofu && echo "🌱 OpenTofu: $(opentofu version | head -n 1)"
command -v terraformer && echo "🗃️ Terraformer installed"
command -v tflint && echo "🧹 TFLint: $(tflint --version)"

# Docker / Podman
command -v docker && echo "🐋 Docker: $(docker --version)"
command -v podman && echo "📦 Podman: $(podman --version)"

# .NET
command -v dotnet && echo "🔵 .NET SDK: $(dotnet --version)"

# TypeScript / Yarn
command -v tsc && echo "🟦 TypeScript: $(tsc --version)"
command -v yarn && echo "🧶 Yarn: $(yarn --version)"

echo ""
echo "✅ Post-install verification finished!"
