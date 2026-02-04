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

#### Recommended terminal emulator,

I recommend using kitty as the terminal emulator and have added a folder called nvim_kitty_config, which one can easily simlink to the correct position in .config/kitty.
https://sw.kovidgoyal.net/kitty/

First backup your own kitty files (if you dont have kitty skip this step)

```shell
mv ~/.config/kitty/kitty.conf ~/.config/kitty/kitty.conf.bak 2>/dev/null
mv ~/.config/kitty/theme.conf ~/.config/kitty/theme.conf.bak 2>/dev/null
```

```shell
ln -s ~/.config/nvim/kitty_nvim_conf/kitty.conf ~/.config/kitty/kitty.conf
ln -s ~/.config/nvim/kitty_nvim_conf/theme.conf ~/.config/kitty/theme.conf
```

#### Useful alias

in ~/.bashrc or ~/.zshrc or ~/.bashaliases

```shell
code() { nvim "$@"; }

```

#### Start Neovim

```shell
nvim
```
