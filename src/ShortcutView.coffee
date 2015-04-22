globalShortcut = require 'global-shortcut'
BrowserWindow = require 'browser-window'

window = null

globalShortcut.register 'ctrl+g', ->
  if window
    do window.show
  else
    window = new BrowserWindow
      width: 400
      height: 75
    window.loadUrl "file://#{__dirname}/ShortcutView.html"
    window.on 'close', ->
      window = null
