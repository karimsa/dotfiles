## External things to install

 - brew: https://brew.sh/
 - oh-my-zsh: https://ohmyz.sh/
 - Xcode cmd line tools
 - nvm: https://github.com/creationix/nvm
 - Node latest LTS

## Setting up dotfiles

Agent-assisted install only. Point an agent at this file and have it run the steps.

1. Clone repo to `~/.dotfiles`
2. Install brew packages: `brew bundle --file ~/.dotfiles/Brewfile`
3. Add to `~/.zshrc`: `source ~/.dotfiles/.rc`
4. Add to `~/.vimrc`: `source ~/.dotfiles/.vimrc`
5. Add to `~/.tmux.conf`: `source ~/.dotfiles/.tmux.conf`
6. Link nvim config: `ln -s ~/.dotfiles/nvim ~/.config/nvim`
7. Open `nvim` once so plugins install from `nvim/lazy-lock.json`

## Verifying

 - `readlink ~/.config/nvim` prints `/Users/<you>/.dotfiles/nvim`
 - `grep dotfiles ~/.zshrc ~/.vimrc ~/.tmux.conf` shows one source line in each
 - `which nvim tmux fzf rg zoxide` all resolve
