# Configurations

## NeoVim

I have moved to Chad Neovim. The directory `nvim-backup` is my older setup.

### Steps to migrate to Chad NeoVim 

**Uninstall existing Neovim**  
1. Use `brew list` or `brew list --cask` to check if I have installed neovim with brew or not. I have, so I run `brew uninstall neovim`
2. I run `rm -rf ~/.local/share/nvim` to delete nvim data files.
3. I reinstall neovim: `brew install neovim`. I have version _0.9_
4. I run `git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1` to install Chad NeoVim.
5. I make some modifications on the Configurations. You will find them in `nvim/lua/custom` directory.
    + I have also kept a separate copy of the same `custom` directory in `chadnvim-initial-custom-dir` directory here.
6. Open nvim, lazy nvim will install stuff
7. Quit, reopen, run `MasonInstallAll` to install `gopls`

**Go IDE**  
Install the following go packages:
1. `go install -v github.com/incu6us/goimports-reviser/v3@latest`
2. `go install mvdan.cc/gofumpt@latest`
3. `go install github.com/segmentio/golines@latest`
4. `go install github.com/go-delve/delve/cmd/dlv@latest`
5. Quite nvim, open `~/.zshrc` and add the following lines: `export PATH=$HOME/go/bin:$PATH`
6. Quit & reopen neovim, run `TSInstall go` to install go grammer for Tree-Sitter.

**Chad Neovim References**   
1. [The perfect Neovim setup for Go - YouTube](https://www.youtube.com/watch?v=i04sSQjd-qo)
2. [Turn VIM into a full featured IDE with only one command - YouTube](https://www.youtube.com/watch?v=Mtgo-nP_r8Y)
3. [NvChad/NvChad: Blazing fast Neovim framework providing solid defaults and a beautiful UI, enhancing your neovim experience.](https://github.com/NvChad/NvChad)
    + [NvChad](https://nvchad.com/docs/quickstart/install)
4. [neovim/neovim: Vim-fork focused on extensibility and usability](https://github.com/neovim/neovim)
    + [Installing Neovim · neovim/neovim Wiki](https://github.com/neovim/neovim/wiki/Installing-Neovim)
5. [NvimTree - Documentation](https://docs.rockylinux.org/books/nvchad/nvchad_ui/nvimtree/)

