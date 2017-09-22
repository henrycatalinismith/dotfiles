const colors = require('./colors');

const plugins = [
  'hyper-hide-title',           // Autohide tab bar when <2 tabs
  'hyper-pane',                 // Arrow key pane navigation
  'hypercwd',                   // New tabs copy cwd from current tab
  'hyperterm-alternatescroll',  // Trackpad scrolling for pager
  'hyperterm-blink',            // Make your cursor blink
];

const fontSize = 18;
const fontFamily = '"Input Mono", Menlo, "DejaVu Sans Mono", "Lucida Console", monospace';

const backgroundColor = '#1f1a1b';
const foregroundColor = '#c4e2f2';
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

