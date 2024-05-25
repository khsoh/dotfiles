alias pip=/usr/local/bin/pip3

# Use vi-mode for command line editing
export EDITOR=vim
set -o vi

tmux () {
    if [[ -z "$1" ]]; then
        if [[ $(command tmux list-session 2>&/dev/null) ]]; then
            command tmux new-session -d && command tmux switch-client -n
        else
            command tmux new-session -A
        fi
    else
        command tmux $@
    fi
}
