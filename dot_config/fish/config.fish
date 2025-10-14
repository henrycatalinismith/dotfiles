alias gup="git remote update --prune; git merge --ff-only @{u}"
alias lg="lazygit"
alias mutt="neomutt"

fish_add_path $HOME/.docker/bin
fish_add_path $HOME/.local/bin

function fish_greeting
    clear
    phoon | lolcat
end

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

set -Ux EDITOR hx
set -Ux GEMRC ~/.config/gem/gemrc
set -Ux IRBRC ~/.config/irb/irbrc
set -Ux GIT_CONFIG_GLOBAL ~/.config/git/config
set -Ux NETHACKOPTIONS ~/.config/nethack/nethackrc
