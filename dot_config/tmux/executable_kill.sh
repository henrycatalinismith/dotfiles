#!/bin/zsh --login

# tmux detaches the client when killing the last window in a session, even if
# there are other sessions open. This is a surprise every single time it
# happens, and this script replaces it with the behavior I wish tmux shipped
# with by default.
#
# The two guiding principles here are:
# 1. Kill as few things as possible.
# 2. Try not to detach the client unless absolutely everything is killed.

SESSION_ID="$1"
WINDOW_ID="$2"
PANE_ID="$3"

count() {
  tmux list-$1 | wc -l | sed "s/ //g"
}

main() {
  # When there's more than one pane in the current window, we only kill that
  # pane, and leave the rest of the window alive.
  if [ "$(count panes)" -gt 1 ]; then
    tmux kill-pane
    return 0
  fi

  # When there's more than one window in the current session, we only kill that
  # window, and leave the rest of the session alive.
  if [ "$(count windows)" -gt 1 ]; then
    tmux kill-window
    return 0
  fi

  # At this point we're about to kill the very last pane of the very last
  # window in the current session. If there's another session open, we need to
  # switch to it before killing the current one so that tmux doesn't detach the
  # client.
  if [ "$(count sessions)" -gt 1 ]; then
    tmux switch-client -n
    tmux kill-session -t "$SESSION_ID"
    return 0
  fi

  # We're killing the very last pane of the very last window in the very last
  # session. There'll be nothing left after this, and tmux will detach the
  # client. Let's save tmux the trouble and just kill the entire server now.
  tmux kill-server
}

main
