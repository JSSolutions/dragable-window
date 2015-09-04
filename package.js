Package.describe({
  name: 'jss:dragable-window',
  version: '1.0.1_1',
  summary: 'Fully customizable dragable window',
  git: 'https://github.com/JSSolutions/dragable-window',
  documentation: 'README.md'
});

Package.onUse(function (api) {
  api.versionsFrom('1.1.0.2');
  api.use('templating');
  api.use('coffeescript');
  api.use('reactive-var');
  api.use('workman:templating-ext@0.0.3');
  api.use('linto:jquery-ui@1.11.2');
  api.addFiles(['dragable-window.html', 'dragable-window.coffee', 'dragable-window.css'], 'client');
});