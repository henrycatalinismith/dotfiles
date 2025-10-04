# dotfiles

Personal config files for setting up new computers

## Palette

[Solarized](https://en.m.wikipedia.org/wiki/Solarized) plus the [bright palette from Selenized Black](https://github.com/jan-warchol/selenized/blob/master/the-values.md#selenized-black). The key here is the addition of an extra dark background colour. It creates enough breathing room in the palette to fully eradicate Solarized's main problem, which is the contrast being too low. It also ensures readable colours even on a monitor in somewhat direct sunlight.

https://contrast-grid.eightshapes.com/?version=1.1.0&background-colors=&foreground-colors=071416%2Cmidnight1%0D%0A05181d%2Cmidnight2%0D%0A%0D%0A002b36%2Csolarized_base03%0D%0A073642%2Csolarized_base02%0D%0A586e75%2Csolarized_base01%0D%0A657b83%2Csolarized_base00%0D%0A839496%2Csolarized_base0%0D%0A93a1a1%2Csolarized_base1%0D%0Aeee8d5%2Csolarized_base2%0D%0Afdf6e3%2Csolarized_base3%0D%0Adc322f%2Csolarized_red%0D%0AE14F4C%2Cadjusted_red%0D%0Aed4a46%2Cselenized_red%0D%0Acb4b16%2Csolarized_orange%0D%0AD85118%2Cadjusted_orange%0D%0Ae67f43%2Cselenized_orange%0D%0Ab58900%2Csolarized_yellow%0D%0Adbb32d%2Cselenized_yellow%0D%0A859900%2Csolarized_green%0D%0A70b433%2Cselenized_green%0D%0A2aa198%2Csolarized_cyan%0D%0A3fc5b7%2Cselenized_cyan%0D%0A268bd2%2Csolarized_blue%0D%0A4f9cfe%2Cselenized_blue%0D%0A6c71c4%2Csolarized_violet%0D%0A8386c9%2Cadjusted_violet%0D%0Aa580e2%2Cselenized_violet%0D%0Ad33682%2Csolarized_magenta%0D%0Aeb6eb7%2Cselenized_magenta&es-color-form__tile-size=compact&es-color-form__show-contrast=aaa&es-color-form__show-contrast=aa&es-color-form__show-contrast=aa18&es-color-form__show-contrast=dnp

## Fish setup

```
brew install fish
echo /opt/homebrew/bin/fish | sudo tee -a /etc/shells
chsh -s /opt/homebrew/bin/fish
```

## License

[Apache-2.0](https://codeberg.org/henrycatalinismith/dotfiles/src/branch/main/license)
