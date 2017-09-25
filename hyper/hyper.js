const colors = {
  black: '234 1c1c1c',
  red: '1 dc322f',
  green: '2 c0d14e',
  yellow: '3 dbd560',
  blue: '4 268bd2',
  magenta: '5 a073d6',
  cyan: '6 1fc2c2',
  white: '7 d0d0d0',
  brightBlack: '239 4e4e4e',
  brightRed: '9 dc776b',
  brightGreen: '10 bde18b',
  brightYellow: '11 fffeb2',
  brightBlue: '12 6fb2e2',
  brightMagenta: '13 df56cc',
  brightCyan: '14 67d8d8',
  brightWhite: '15 ffffff',
};

const plugins = [
  'hyper-hide-title',           // Autohide tab bar when <2 tabs
  'hyper-pane',                 // Arrow key pane navigation
  'hypercwd',                   // New tabs copy cwd from current tab
  'hyperterm-alternatescroll',  // Trackpad scrolling for pager
  'hyperterm-blink',            // Make your cursor blink
];

const fontSize = 18;
const fontFamily = '"Input Mono", Menlo, "DejaVu Sans Mono", "Lucida Console", monospace';

const backgroundColor = colors.black;
const foregroundColor = colors.white;
const cursorColor = 'rgba(173, 216, 119, 0.5)';
const cursorShape = 'BEAM';

const css = `
  * {
    -webkit-font-feature-settings: "liga" on, "calt" on, "dlig" on !important;
    text-rendering: optimizeLegibility !important;
    font-weight: 500;
  }
`;

module.exports = {
  config: {
    fontSize,
    fontFamily,

    backgroundColor,
    foregroundColor,

    colors,
    css,

    cursorColor,
    cursorShape,

    bell: false,
  },
  plugins,
};

