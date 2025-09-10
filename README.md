# Basic macOS Initial Setup

This repository contains my personal dotfiles and a bootstrap script to set up a new macOS machine for development in Python, C#, TypeScript, and Go. Additionally, tools for IaaS and container management are included as well. I have not included any particular IDE or editor...you can install what you like from your preferred source. 

## ✨ Features

This setup script will:

-   Install **Homebrew** (the macOS package manager).
-   Install and configure **Zsh** as the default shell.
-   Install **Oh My Zsh** for shell management.
-   Install and configure the **Powerlevel10k** theme.
-   Install essential **Oh My Zsh plugins**: `zsh-autosuggestions` and `zsh-syntax-highlighting`.
-   Install a wide array of **CLI tools, languages, and applications** via Homebrew and Homebrew Cask, as defined in the `Brewfile`.
-   Set up **Rust** with `rustup` and install common `cargo` development tools.
-   Set up **Go** and install common `go` development tools.
-   Install specific **Python versions** (3.11, 3.12, 3.13) and `pipx`.
-   Install **C#/.NET SDK** with cross-platform development workloads (MAUI, WASM, Android, iOS).
-   Install **Node.js** (via Homebrew, alongside NVM for version management).
-   Install **TypeScript** and **Yarn** globally.
-   Symlink key configuration files (`.zshrc`, `.p10k.zsh`) from this repository to your home directory.
-   Perform a **post-installation verification** to confirm everything is set up correctly.

## 🚀 Getting Started

To set up a new macOS machine, follow these steps:

1.  **Clone this repository:**
    Open your Terminal and clone this repository into your home directory. Replace `YOUR_USERNAME` with your GitHub username.

    ```bash
    git clone git@github.com:n8jja/mac-bootstrap.git ~/mac-bootstrap
    ```

2.  **Run the bootstrap script:**
    Navigate into the cloned directory and execute the `bootstrap.sh` script. This script will handle all installations and configurations.

    ```bash
    cd ~/dotfiles
    chmod +x bootstrap.sh # Make the script executable
    ./bootstrap.sh
    ```

3.  **Restart your terminal:**
    After the script completes, close and reopen your terminal application (or run `exec zsh`) to ensure all new configurations and PATH changes are loaded.

4.  **Configure Powerlevel10k (optional):**
    The first time you open a new terminal, Powerlevel10k might prompt you to run its configuration wizard (`p10k configure`). Follow the prompts to customize your terminal's appearance.

## 📦 What's Installed

The `Brewfile` defines all the packages installed via Homebrew. Here's a summary of what's included:

### Core CLI Tools
-   `git`: Version control system
-   `wget`, `curl`: Network utilities
-   `tree`: Directory listing utility
-   `ripgrep`: Fast line-oriented search tool
-   `fzf`: Command-line fuzzy finder
-   `gnupg`: GNU Privacy Guard
-   `jq`: JSON processor
-   `tmux`: Terminal multiplexer
-   `telnet`: Network protocol for remote access

### Build & Development Tools
-   `automake`, `ccache`, `cmake`, `ninja`, `pkgconf`: Build system tools
-   `uv`: Python package installer and resolver
-   `dfu-util`: Device Firmware Update utility
-   `ffmpeg`: Multimedia framework
-   `htpdate`: HTTP-based time synchronization
-   `icu4c@76`: International Components for Unicode
-   `jmeter`: Apache JMeter for load testing
-   `lazygit`: Git UI for the terminal
-   `libtensorflow`: TensorFlow C library
-   `mlx`: Machine learning framework
-   `pandoc`: Universal document converter

### Cloud & Infrastructure
-   `azure/azd/azd`: Azure Developer CLI
-   `azure/functions/azure-functions-core-tools@4`: Azure Functions Core Tools
-   `hashicorp/tap/terraform`: Terraform CLI
-   `hashicorp/tap/terraform-ls`: Terraform Language Server
-   `opentofu`: Open-source Terraform alternative
-   `terraformer`: CLI tool to generate TF from existing infrastructure
-   `tflint`: Terraform linter
-   `aztfexport`: Azure Terraform Export

### Databases & Data Tools
-   `microsoft/mssql-release/mssql-tools18`: Microsoft SQL Server command-line tools
-   `postgresql@17`: PostgreSQL database
-   `parquet-cli`: CLI for Apache Parquet files

### Programming Languages & Runtimes
-   `zsh`: Zsh shell
-   `nvm`: Node Version Manager
-   `pipx`: Install and run Python applications in isolated environments
-   `thefuck`: Corrects previous console commands
-   `broot`: Fuzzy file navigator
-   `ollama`: Run large language models locally
-   `llm`: CLI for interacting with LLMs
-   `tabbyml/tabby/tabby`: Self-hosted AI coding assistant
-   `rustup-init`: Rust toolchain installer
-   `go`: Go programming language
-   `python@3.11`, `python@3.12`, `python@3.13`: Specific Python versions
-   `r`: R programming language
-   `openjdk`, `openjdk@11`: OpenJDK Java Development Kit
-   `dotnet`, `mono`: .NET SDK and Mono runtime
-   `node`: Node.js runtime
-   `yarn`: JavaScript package manager

### Containerization
-   `colima`: Container runtimes on macOS (Docker, containerd)
-   `podman`: Daemonless container engine
-   `docker`: Docker CLI

### GUI Applications (via Homebrew Cask)
-   `iterm2`: Terminal emulator
-   `spotify`: Music streaming
-   `bleunlock`: Unlock Mac with iOS device
-   `bruno`: API client
-   `git-credential-manager`: Git credential helper
-   `miniconda`: Minimal Anaconda installer
-   `podman-desktop`: Desktop GUI for Podman
-   `vagrant`: Tool for building and managing virtual machine environments
-   `orbstack`: Fast, lightweight Docker & Linux VMs

### Fonts
-   `font-meslo-lg-nerd-font`: Recommended font for Powerlevel10k

## ⚙️ Configuration Files

-   `.zshrc`: Your primary Zsh configuration file, including plugin and theme settings, and custom PATH exports for Rust, Go, and Node.
-   `.p10k.zsh`: Configuration for the Powerlevel10k Zsh theme.
-   `Brewfile`: A list of all Homebrew packages (formulae and casks) to be installed.

## 🤝 Contributing

Feel free to fork this repository and adapt it to your own needs. If you have suggestions for improvements or find issues, feel free to open an issue.

---

This `README.md` should give you a solid foundation for getting up and running for development pretty quickly on a new Mac. 
