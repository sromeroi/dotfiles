#!/bin/bash
#
# Setup the vimfiles repository: downloads Vundle, 
#
# mkdir ~/.bash && cd ~/.bash && git clone git://github.com/jimeh/git-aware-prompt.git 
# cd $HOME && git clone https://github.com/sromeroi/dotfiles .dotfiles
# cd .dotfiles && sh install.sh
# vim .git/config
## Add sromeroi@ to URL
#
# vim ~/.bashrc
## Add:
# source ~/.termcolors.sh
# source ~/.vars.sh
#

NOW=$(date +%Y%m%d_%H%M)

echo -e "\n--- dotfiles install script ---"

if [ ! -e tmux.conf ] || [ ! -e install.sh ];
then
    echo -e "\nERROR: You must be inside the .dotfiles directory to launch install.sh.\n"
    exit 1
fi

echo -e "\n* Symlinking files..."

# Files: make a backup. Symlinks: check if they're already OK
for FILE in tmux.conf termcolors.sh vars.sh ; do
    if [ -f ~/.${FILE} ] && [ ! -L ~/.${FILE} ];
    then
        mv ~/.${FILE} ~/${FILE}.${NOW}
    fi
    if [ -L ~/.${FILE} ];
    then
        DESTLINK=$(readlink -f ~/.${FILE})
        if [ "$DESTLINK" != "${PWD}/${FILE}" ];
        then 
            rm -f ~/.${FILE}
        else
            continue
        fi
    fi
    ln -s ${PWD}/${FILE} ~/.${FILE}
done

echo -e "\n--- done! ---\n"

