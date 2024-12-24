## Tools

- Bash or Zsh
- [Monaspice Nerd Font](https://www.nerdfonts.com/)
- [Wezterm](https://wezfurlong.org/wezterm/index.html)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [fzf](https://github.com/junegunn/fzf)
- [tmux](https://github.com/tmux/tmux/wiki)
- [Starship Prompt](https://starship.rs/)
- [Neovim](https://neovim.io/)

## Setup

1. Clone the repository.
2. Symlink or copy from the repository to the $HOME directory.
    ```
    .bashrc -> $HOME/.bashrc
    .condarc -> $HOME/.condarc
    .gitcommands -> $HOME/.gitcommands
    .gitconfig -> $HOME/.gitconfig
    .tmux.confg -> $HOME/.tmux.conf
    .wezterm.lua -> $HOME/.wezterm.lua
    .zshrc -> $HOME/.zshrc
    .config/starship.toml -> $HOME/.config/starship.toml
    .config/nvim -> $HOME/.config/nvim
    ```

## Additional Setup

### Zsh

1. Install
   [`zsh-syntax-highlighting`](https://github.com/zsh-users/zsh-syntax-highlighting)
and  [`zsh-autosuggestions`](https://github.com/zsh-users/zsh-autosuggestions).
They will be activated in `.zshrc` or `.bashrc`.

### tmux

1. Source the new config if tmux is already running.
    ```shell
    tmux source ~/.tmux.conf
    ```

2. Start tmux and press `CTRL+B i` to install plugins.

### Neovim

1. Start Neovim and run `:Lazy restore` to install plugins.
2. Install LSPs, Linters, and Formatters with `:Mason`
    - `pyright`
    - `black`
    - `isort`
    - `flake8`
    - `json-lsp`
    - `marksman`
    - `html-lsp`
    - `lua-language-server`
    - `stylua`
