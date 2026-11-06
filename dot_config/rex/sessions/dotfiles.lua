return {
  label = "dotfiles",
  cwd   = "~/.config",
  tabs  = {
    { name = "nvim", command = { "nvim" } },
    { name = "opencode", command = { "opencode" } },
    {
      name  = "chezmoi",
      cwd   = "~/dotfiles",
      split = "right",
      panes = {
        { name = "lazygit", command = { "lazygit" } },
        { name = "zsh" },
      },
    },
  },
}
