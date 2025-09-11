# eslint diagnostics using none-ls

Neovim's LSP diagnostics are built around an assumption that all your
diagnostics needs are fulfiled by a language server and eslint falls awkwardly
outside that asumption. The duct-tape solution that makes it work anyway here is
none-ls and its eslint plugin.

## Usage

```
npm i
nvim -u init.lua example.js
```

## Output

```
  function main() {
E   console.log("Hello, world!");     ■ Unexpected console statement.
    return 0;
  }
```
