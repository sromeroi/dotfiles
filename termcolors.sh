# Include this file in your .bashrc 

export BLACK="\[\e[00;30m\]"
export BLUE="\[\e[00;34m\]"
export GREEN="\[\e[00;32m\]"
export CYAN="\[\e[00;36m\]"
export RED="\[\e[00;31m\]"
export PURPLE="\[\e[00;35m\]"
export BROWN="\[\e[00;33m\]"
export GRAY="\[\e[01;30m\]"
export L_GRAY="\[\e[00;37m\]"
export L_BLUE="\[\e[01;34m\]"
export L_GREEN="\[\e[01;32m\]"
export L_CYAN="\[\e[01;36m\]"
export L_RED="\[\e[01;31m\]"
export L_PURPLE="\[\e[01;35m\]"
export L_YELLOW="\[\e[01;33m\]"
export L_WHITE="\[\e[01;37m\]"
export NORMAL="\[\e[00m\]"

export TERM=xterm-256color

HOSTNAME=$(hostname)
USER="$USER"

# Default prompt for unknown machines:
if [ "${USER}" == "root" ]; then
    export PS1="${L_RED}\u@\H:${BLUE} \w \$${NORMAL} "
else
    export PS1="${L_GREEN}\u@\H:${BLUE} \w \$${NORMAL} "
fi

# Home's laptop:
if [ "${HOSTNAME}" == "compiler" ];
then
    if [ "${USER}" == "sromero" ]; then
        export PS1="${L_GREEN}\u@\H:${BLUE} \w \$${NORMAL} "
    elif [ "${USER}" == "root" ]; then
        export PS1="${L_RED}\u@\H:${BLUE} \w \$${NORMAL} "
    fi
fi

# dfs-sgf01qa-82
if [ "${HOSTNAME}" == "dfs-sgf01qa-82" ];
then
    if [ "${USER}" == "sromero" ]; then
        export PS1="${L_YELLOW}\u@\H:${BLUE} \w ${PURPLE}\$git_branch${RED}\$git_dirty ${GREEN}\$${NORMAL} "
    elif [ "${USER}" == "root" ]; then
        export PS1="${CYAN}(SAGE) ${L_RED}\u@\H:${BLUE} \w #${NORMAL} "
    fi
fi

