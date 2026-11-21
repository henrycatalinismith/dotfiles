return {
  label = "dotfiles",
  cwd   = "~/.config",
  tabs  = {
    { command = { "hx" } },
    { command = { "opencode" } },
    {
      name  = "chezmoi",
      cwd   = "~/dotfiles",
      split = "right",
      panes = {
        { command = { "lazygit" } },
        { name = "zsh" },
      },
    },
  },
}
