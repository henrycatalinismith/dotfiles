#!/bin/zsh --login

# tmux doesn't have a built-in way to create a new session and immediately
# switch to it in one step. So this script glues the existing APIs together.

tmux switch-client -t $(tmux new-session -dP)

