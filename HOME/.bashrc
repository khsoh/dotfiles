alias pip=/usr/local/bin/pip3

tmux () {
    if [[ -z "$1" && -z "$TMUX" ]]; then
        command tmux new-session -A
    else
        command tmux $@
    fi
}
