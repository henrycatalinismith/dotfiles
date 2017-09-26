const colors = {
  black: '#1c1c1c',
  red: '#d70000',
  green: '#afd75f',
  yellow: '#d7d75f',
  blue: '#5f87ff',
  magenta: '#a073d6',
  cyan: '#00afaf',
  white: '#d0d0d0',
  brightBlack: '#4e4e4e',
  brightRed: '#d75f5f',
  brightGreen: '#bde18b',
  brightYellow: '#ffd700',
  brightBlue: '#5fafd7',
  brightMagenta: '#df56cc',
  brightCyan: '#5fd7d7',
  brightWhite: '#eeeeee',
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

