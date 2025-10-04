alias g='git'
alias ga='git add'
alias gaa='git add --all'
alias gapa='git add --patch'
alias gb='git branch'
alias gba='git branch --all'
alias gbd='git branch --delete'
alias gbD='git branch --delete --force'
alias gbm='git branch --move'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gcp='git cherry-pick'
alias gcam='git commit --all --message'
alias gca='git commit --verbose --all'
alias gca!='git commit --verbose --all --amend'
alias gd='git diff'
alias gdca='git diff --cached'
alias glgga='git log --graph --decorate --all'
alias glgm='git log --graph --max-count=10'
alias glods='git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset" --date=short'
alias glod='git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset"'
alias glola='git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset" --all'
alias glols='git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset" --stat'
alias glol='git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset"'
alias glo='git log --oneline --decorate'
alias glog='git log --oneline --decorate --graph'
alias gloga='git log --oneline --decorate --graph --all'
alias gm='git merge'
alias gpr='git pull --rebase'
alias gprv='git pull --rebase -v'
alias gp='git push'
alias gpd='git push --dry-run'
alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias gr='git remote'
alias grv='git remote --verbose'
alias gra='git remote add'
alias grrm='git remote remove'
alias grmv='git remote rename'
alias grh='git reset'
alias gru='git reset --'
alias gsb='git status --short --branch'
alias gup="git remote update --prune; git merge --ff-only @{u}"
alias lg="lazygit"
alias mutt="neomutt"

fish_add_path $HOME/.docker/bin
fish_add_path $HOME/.local/bin

function fish_prompt
  set_color 92a1a1
  echo -n '$ '
  set_color normal
end

if status is-interactive
  atuin init fish | source
end

function zellij_tab_name_update --on-event fish_preexec
  if set -q ZELLIJ
    set title (string split ' ' $argv)[1]
    command nohup zellij action rename-tab $title >/dev/null 2>&1
  end
end

function zellij_tab_name_reset --on-event fish_postexec
  if set -q ZELLIJ
    command nohup zellij action rename-tab "fish" >/dev/null 2>&1
  end
end

