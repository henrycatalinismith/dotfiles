# TypeScript Diagnostics

Want to see how little config it's possible to get away with and still have
working TypeScript diagnostics.

## Usage

```
npm i
nvim -u init.lua example.ts
```

## Output

```
  function main(): number {
    console.log("Hello, world!");
E   return "-1";     ■ Type 'string' is not assignable to type 'number'.
  }
```
