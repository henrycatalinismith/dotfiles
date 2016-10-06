module.exports = {
  config: {

    fontSize: 16,
    fontFamily: 'Menlo, "DejaVu Sans Mono", "Lucida Console", monospace',
    cursorShape: 'BEAM',
    padding: '12px 14px',

    shell: 'zsh',
    shellArgs: ['--login'],
    env: {},
    bell: false,
    copyOnSelect: false

  },

  plugins: [
    'hyperterm-blink',
    'hyperterm-solarized-dark'
  ],

  localPlugins: []
};
