template for getting started with [AstroNvim](https://github.com/AstroNvim/AstroNvim)

## ⚡ Requirements (copied from the official AstroNvim github)

- [Nerd Fonts](https://www.nerdfonts.com/font-downloads) (_Optional with manual intervention:_ See [Documentation on customizing icons](https://docs.astronvim.com/Recipes/icons)) <sup>[[1]](#1)</sup>
- [Neovim 0.10+ (_Not_ including nightly)](https://github.com/neovim/neovim/releases/tag/stable)
- [Tree-sitter CLI](https://github.com/tree-sitter/tree-sitter/blob/master/cli/README.md) (_Note:_ This is only necessary if you want to use `auto_install` feature with Treesitter)
- A clipboard tool is necessary for the integration with the system clipboard (see [`:help clipboard-tool`](https://neovim.io/doc/user/provider.html#clipboard-tool) for supported solutions)
- Terminal with true color support (for the default theme, otherwise it is dependent on the theme you are using) <sup>[[2]](#2)</sup>
- Optional Requirements:
  - [ripgrep](https://github.com/BurntSushi/ripgrep) - live grep picker search (`<leader>fw`)
  - [lazygit](https://github.com/jesseduffield/lazygit) - git ui toggle terminal (`<leader>tl` or `<leader>gg`)
  - [go DiskUsage()](https://github.com/dundee/gdu) - disk usage toggle terminal (`<leader>tu`)
  - [bottom](https://github.com/ClementTsang/bottom) - process viewer toggle terminal (`<leader>tt`)
  - [Python](https://www.python.org/) - python repl toggle terminal (`<leader>tp`)
  - [Node](https://nodejs.org/en/) - node repl toggle terminal (`<leader>tn`)

#### Dependencies

I recommend installing tree-sitter-cli through cargo and installing rust through rustup if you intend to use rust again later, this is simply done by

```shell
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
cargo install tree-sitter-cli

```

```shell
sudo apt install ripgrep fzf npm python3-pip gdu imagemagick ghostscript fd-find wl-clipboard -y
```

#### To use astrovim need nvim >= 0.10
If you installed nvim through apt it is likely an old version, therefore we want to delete it first.

```shell
sudo apt remove neovim -y  # if installed via apt
```

```shell
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
sudo mv /opt/nvim-linux-x86_64 /opt/nvim
echo 'export PATH="$PATH:/opt/nvim/bin"' >> ~/.bashrc
source ~/.bashrc
nvim --version
```

#### A Nerd Font
Here i show how to install JetBrainsMono but you can pick any you like:

mkdir -p ~/.local/share/fonts && cd ~/.local/share/fonts
curl -fLO https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
unzip -o JetBrainsMono.zip -d JetBrainsMono && rm JetBrainsMono.zip && fc-cache -f

Then inside nvim (Mason-managed LSPs/formatters):
:MasonInstall clangd clang-format basedpyright black ruff lua-language-server stylua shfmt jq yamlfmt# A Nerd Font (kitty/starship/fastfetch glyphs). JetBrainsMono shown; pick any:
mkdir -p ~/.local/share/fonts && cd ~/.local/share/fonts
curl -fLO https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
unzip -o JetBrainsMono.zip -d JetBrainsMono && rm JetBrainsMono.zip && fc-cache -f

And again inside nvim:
:MasonInstall clangd clang-format basedpyright black ruff lua-language-server stylua shfmt jq yamlfmt

#### My Mason Installs

```shell
:MasonInstall clangd clang-format basedpyright black ruff lua-language-server stylua shfmt jq yamlfmt
```

#### Recommended terminal emulator (skip this step if you have your own emulator)

I recommend using kitty as the terminal emulator and have added a folder called nvim_kitty_config, which one can easily simlink to the correct position in .config/kitty.
https://sw.kovidgoyal.net/kitty/

First backup your own kitty files

```shell
mv ~/.config/kitty/kitty.conf ~/.config/kitty/kitty.conf.bak 2>/dev/null
mv ~/.config/kitty/theme.conf ~/.config/kitty/theme.conf.bak 2>/dev/null
```

```shell
ln -s ~/.config/nvim/kitty_nvim_conf/kitty.conf ~/.config/kitty/kitty.conf
ln -s ~/.config/nvim/kitty_nvim_conf/theme.conf ~/.config/kitty/theme.conf
```

#### Useful aliases

in ~/.bashrc or ~/.zshrc or ~/.bashaliases

```shell
code() { nvim "$@"; }
```

## For automatic code completion

```shell
# Bash completions
if ! shopt -oq posix; then
	if [ -f /usr/share/bash-completion/bash_completion ]; then
		. /usr/share/bash-completion/bash_completion
	elif [ -f /etc/bash_completion ]; then
		. /etc/bash_completion
	fi
fi
[ -f ~/.local/share/bash-completion/completions/rustup ]
```

# For fuzzy reverse-search using fzf
```shell
# fzf (Ctrl+R fuzzy history search)
[ -f /usr/share/doc/fzf/examples/key-bindings.bash ] && source /usr/share/doc/fzf/examples/key-bindings.bash
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
```

#### Start Neovim

```shell
nvim
```
