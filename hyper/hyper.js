const colors = {
  black: '#1f1a1b',
  red: '#dc322f',
  green: '#C0D14E',
  yellow: '#dbd560',
  blue: '#268bd2',
  magenta: '#a073d6',
  cyan: '#1FC2C2',
  white: '#d0d0d0',
  brightBlack: '#4b4b4b',
  brightRed: '#DC776B',
  brightGreen: '#bde18b',
  brightYellow: '#fffeb2',
  brightBlue: '#6FB2E2',
  brightMagenta: '#df56cc',
  brightCyan: '#67D8D8',
  brightWhite: '#ffffff',
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

