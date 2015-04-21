globalShortcut = require 'global-shortcut'
EventBus = require './EventBus'

globalShortcut.register 'ctrl+g', ->
  EventBus.emit 'new-remote-repository', 'https://github.com/MisumiRize/vcs-clone'
