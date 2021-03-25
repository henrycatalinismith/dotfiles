<p align="center">
  <img
    alt="dotfiles"
    src="https://raw.githubusercontent.com/hendotcat/dotfiles/trunk/dotfiles.svg"
    height="64"
    width="256"
  />
  <br />
  <strong>
    my devtools setup
  </strong>
</p>

![Screenshot showing the 'dotfiles' command running with no arguments outputting
the usage guide from .zshrc](https://github.com/hendotcat/dotfiles/blob/trunk/screenshot.png?raw=true)

### Install

Run `xcode-select --install` first.
Then install [homebrew] and [oh-my-zsh].
Run `brew install git` to update Git.
Once all that's done, run this:

```bash
/bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/hendotcat/dotfiles/trunk/install.sh)"
```

### About

This is based on [Nicola Paolucci's dotfiles setup blog post][How to store dotfiles].
It expands a little bit on the technique described there, and that post is structured as a tutorial, so here's a quick technical rundown of the way this works so that I can understand it again next time I need to.

#### Bare checkout and `--work-tree` alias

The main problem with keeping dotfiles under version control is that you don't want your whole home directory inside a Git repository.
We're solving that here by doing a [`--bare`][--bare] checkout of the dotfiles repo into `~/.dotfiles` so that it's off to the side a little.
The [`--work-tree`][--work-tree] flag takes care of telling Git to treat the files in the home directory as if they belong to that repo.

```bash
# commits dotfiles changes to
# the ~/.dotfiles repo from
# outside in the home directory
git \
  --git-dir=$HOME/.dotfiles/ \
  --work-tree=$HOME \
  commit -am "save config changes"
```

Passing all those long options to Git all the time would be a pain, so we set it up as an alias for convenience.

#### Sparse checkout and `.gitignore`

One of the limitations of the dotfiles blog post I based this on is that anything you put in your repo is checked out into your home directory.
For me, something this complex needs documentation or I'll never be able to understand it again when it breaks 5 years down the line.
The workaround for that is [`git sparse-checkout`][sparse-checkout], which allows you to tell Git to only checkout a subset of files.

```bash
# This only checks out two of the
# files in the repo. It's
# important to call "set" instead
# of "add" for the first file to
# clean out the defaults which
# contain a pattern that matches
# all files.
git sparse-checkout init
git sparse-checkout set .gitconfig
git sparse-checkout add .vimrc
git checkout
```

The downside of using this is that Apple are still shipping Git v2.24, and `sparse-checkout` was added in v2.25. So until Apple update that, the code in `install.sh` doesn't work unless you've already upgraded Git before running it.

Nicola's blog post recommends setting [`status.showUntrackedFiles`][status.showUntrackedFiles] to prevent Git from listing the entire contents of the home directory. I've found it's good to go a step further and use `.gitignore` to ignore everything except the specific list of files that actually belong to the repo. Lately macOS has become very strict about user consent when apps ask for filesystem access, so telling Git not to scan all your documents and photos avoids a lot of permissions dialog spam.

```gitignore
# the * means ignore everything
*

# then ! adds exceptions
!.gitconfig
!.vimrc
```

#### Extra magic on top

Aliasing the `dotfiles` command to handle the plumbing between the home directory and the repo is nice, but I needed some extras on top of that. Whenever I set up a new computer there's always a bunch of tools I need to install. It's impossible to remember them all at once so instead I spend weeks getting interrupted in the middle of something as I stumble on another missing tool I haven't installed yet. To avoid that, I've hooked up some "quick start" commands to get some basics set up straight away.

```zsh
function dotfiles() {
  case $1 in
  "toolbox")
    # running `dotfiles toolbox`
    # installs all this stuff
    brew install git node wget
    ;;

  *)
    # other `dotfiles` commands
    # are just passed straight
    # through to git
    git \
      --git-dir=$HOME/.dotfiles/ \
      --work-tree=$HOME $@
    ;;
  esac
}
```

#### iTerm2

Would have been nice to automate the iTerm2 theme installation and keyboard config, but the Python API for that thing seems to require manual work of its own to enable, so there's not really much point using it for this. So instead here's some bookmarks.

1. https://www.iterm2.com/
1. https://draculatheme.com/iterm/
1. https://medium.com/@jonnyhaynes/jump-forwards-backwards-and-delete-a-word-in-iterm2-on-mac-os-43821511f0a/


[How to store dotfiles]: https://www.atlassian.com/git/tutorials/dotfiles
[homebrew]: https://brew.sh
[oh-my-zsh]: https://ohmyz.sh
[--bare]: https://git-scm.com/docs/git#Documentation/git.txt---bare
[--work-tree]: https://git-scm.com/docs/git#Documentation/git.txt---work-treeltpathgt
[sparse-checkout]: https://git-scm.com/docs/git-sparse-checkout
[status.showUntrackedFiles]: https://git-scm.com/docs/git-config#Documentation/git-config.txt-statusshowUntrackedFiles
