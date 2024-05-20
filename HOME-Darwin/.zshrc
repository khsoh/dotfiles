
if [ -z "${TERMINFO_DIRS}" ]; then
    export TERMINFO_DIRS=/usr/share/terminfo
fi
export TERMINFO_DIRS=$TERMINFO_DIRS:$HOME/.local/share/terminfo
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share

tmux () {
    if [[ -z "$1" ]]; then
        if [[ $(command tmux list-session 2>&/dev/null) ]]; then
            command tmux new-session -d
        else
            command tmux new-session -A
        fi
    else
        command tmux $@
    fi
}

