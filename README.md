# dotfiles

Dotfiles for $HOME. Includes common setups for bash prompts (.termcolors.sh), bash variables (.vars.sh), GIT config (.gitconfig), TMUX, etc. This allows to maintain the same config base for several client and server machines, uploading changes to github to keep them under version control.

Fork this repository to have your our "dotfiles" system.

Then clone your repository in your HOME with:

    git clone https://github.com/YOURUSER/dotfiles.git .dotfiles

The `install.sh` script will symlink each file in the .dotfiles folder to $HOME (example: `~/.tmux.conf` will point to `~/.dotfiles/tmux.conf`).

