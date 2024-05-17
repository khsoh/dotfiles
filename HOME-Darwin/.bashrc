alias pip=/usr/local/bin/pip3

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
