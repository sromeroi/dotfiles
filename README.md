# sromeroi's dotfiles 

Dotfiles for `$HOME`. Includes common setups for bash prompts (`.termcolors.sh`), bash variables (`.vars.sh`), GIT config (`.gitconfig`), TMUX (`.tmux.conf`), etc. This allows to maintain the same config base for several client and server machines, uploading changes to github to keep them under version control.


## Installation

Requires GIT and GNU Stow:

1.- Fork this repository to have your our "dotfiles" system.

2.- Then clone your repository in your HOME with:

    git clone https://github.com/YOURUSER/dotfiles.git .dotfiles

3.- Backup your current configuration files and rename/remove them from your HOME.

4.- Enter inside the .dotfiles folder and use stow tool to create the symlinks for the configuration files you want to keep into dotfiles.

    stow bash
    stow tmux
    stow (etc...)

5.- Use the files where desired. Example, edit `~/.bashrc` and add:

    source ~/.termcolors.sh
    source ~/.vars.sh

6.- Profit!


