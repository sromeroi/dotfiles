
LANGUAGE="en"
LANG="en_US.UTF-8"
LC_NUMERIC="en_US.UTF-8"
LC_TIME="en_US.UTF-8"
LC_MONETARY="en_US.UTF-8"
LC_PAPER="en_US.UTF-8"
LC_IDENTIFICATION="en_US.UTF-8"
LC_NAME="en_US.UTF-8"
LC_ADDRESS="en_US.UTF-8"
LC_TELEPHONE="en_US.UTF-8"
LC_MEASUREMENT="en_US.UTF-8"

export HISTCONTROL=ignoreboth
alias push="pushd ."
alias pop="popd"

if [ "$TERM" == "xterm" ]; then
    # No it isn't, it's gnome-terminal
    export TERM=xterm-256color
fi

export EDITOR="vim"
export VISUAL="vim"
set -o emacs

# mkdir ~/.bash && cd ~/.bash && git clone git://github.com/jimeh/git-aware-prompt.git
if [ -e ${HOME}/.bash/git-aware-prompt ];
then
    export GITAWAREPROMPT=${HOME}/.bash/git-aware-prompt
    source "${GITAWAREPROMPT}/main.sh"
fi

# Fix home and end under Tmux 1.8+
if [[ -n "$TMUX" ]]; then
  bind '"\e[1~":"\eOH"'
  bind '"\e[4~":"\eOF"'
fi

# aliases
#alias httpserver='python2 -m SimpleHTTPServer 8000'
alias httpserver='python3 -m http.server 8000'


