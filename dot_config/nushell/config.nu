export alias lg = lazygit
export alias gca! = git commit --verbose --all --amend
export alias gcam = git commit --all --message
export alias gd = git diff
export alias gp = git push
export alias gco = git checkout
export alias gcda = git diff --cached
export alias gup = git remote update origin --prune
export alias grb = git rebase
export alias glog = git log --oneline --decorate --graph
export alias gcp = git cherry-pick
export alias gg = git grep
export alias gaa = git add --all
export alias gb = git 
export alias gp = git push
export alias gbd = git branch --delete
export alias gbD = git branch --delete --force
export alias gb = git 
export alias gap = git add --patch
export alias gi = git grep --ignore-case
export alias gsb = git status --short --branch

$env.config.buffer_editor = "hx"
$env.config.show_banner = false
$env.PATH = $env.PATH | prepend ["/opt/homebrew/bin"]
$env.HELIX_RUNTIME = $env.HOME | path join "helix" "runtime"

$env.XDG_CACHE_HOME  = $env.HOME | path join ".cache"
$env.XDG_CONFIG_HOME = $env.HOME | path join ".config"
$env.XDG_DATA_HOME   = $env.HOME | path join ".local" "share"
$env.XDG_STATE_HOME  = $env.HOME | path join ".local" "state"

 # source ~/.config/nushell/conf.d/atuin.nu

$env.config.history = {
    file_format: "sqlite"
    max_size: 9_999_999
    sync_on_enter: true
}

$env.config = ($env.config | upsert hooks {

    pre_prompt: [ { 
        zellij action rename-tab "nu";
    } ]
    pre_execution: [ { || 
        mut repl_commandline = (commandline)
        if ($repl_commandline | str length) > 15 {
            $repl_commandline = ($repl_commandline | str substring 0..14) + "..."
        }
        zellij action rename-tab ($repl_commandline)
    } ]
})

