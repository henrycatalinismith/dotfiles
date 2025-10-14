# dotfiles

Personal config files for setting up new computers

## Core Tools

This setup is based on a core group of tools that underpin every workflow.

| Name      | Purpose           |
|-----------|-------------------|
| [Ghostty] | Terminal emulator |
| [Zellij]  | Multiplexer       |
| [Fish]    | Shell             |
| [Helix]   | Text editor       |

[Ghostty]: https://ghostty.org/
[Zellij]:  https://zellij.dev/
[Fish]: https://fishshell.com/
[Helix]: https://helix-editor.com/

All four of these have been chosen for their batteries-included design philosophy.
Ghostty's support for functionality like unbinding particular key combinations is key for maximising flexibility for the other tools.
Zellij comes out of the box with a UX that requires half a dozen plugins to replicate in tmux.
Fish is like if zsh was redesigned to merge oh-my-zsh upstream.
And Helix is like if Neovim shipped with all the LSP and Telescope stuff built-in.

## Palette

Almost everyone creating terminal palettes misunderstands the problem space somewhat.
After years of struggle I've given up searching and made my own.

A terminal colour palette is a background, a foreground, and then 16 general purpose colours.
Those 16 are two variants each of black, red, green, yellow, blue, magenta, cyan and white.
One thing almost everyone misunderstands is that every single one of those 16 colours can be used as a foreground colour.
This means they all need sufficient contrast against the one main background colour to be legible.
People making a dark theme tend to fuck up the two blacks, while light themes will tend to have terrible white colours.
If you've ever noticed that some of the text in the output of certain unit test frameworks or whatever was impossible to read because it blended into the background, this is why.

A related mistake that's equally common is that people screw up the background colour by making its lightness too close to that of the foreground colours.
Solarized Dark is a great example of this, with its background blue so bright that half the content tones and some of the accent colours don't even pass the WCAG contrast minimums.
I have a theory that if you're inexperienced in working with colour you have this beginner's bias to want everything to be a loud attention-grabbing foreground colour.
A very dark or very bright colour that's quite close to full black or full white doesn't feel so exciting during the creative process so you inch closer and closer to your foreground colours until it feels cool.
The end result is a palette that's trying to upstage the information it's supposed to be there to enhance.

So I've taken the Solarized Dark palette and cranked down the lightness of the background colour to an almost-black #05181d so that there's shitloads of contrast for every foreground colour.
I've also used the base00 colour (#657b83) as the black value for the palette instead of the commonly chosen base02 (#073642), which is the secret ingredient to ensure absolutely every foreground colour is legible.

## Fish setup

```
brew install fish
echo /opt/homebrew/bin/fish | sudo tee -a /etc/shells
chsh -s /opt/homebrew/bin/fish
```

## License

[Apache-2.0](https://codeberg.org/henrycatalinismith/dotfiles/src/branch/main/license)
