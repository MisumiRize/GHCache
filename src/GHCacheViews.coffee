BrowserWindow = require 'browser-window'
{EventEmitter} = require 'events'
RemoteRepositoryStore = require './RemoteRepositoryStore'
EventBus = require './EventBus'

instance = new EventEmitter
windows = {}

createWindow = ->
  window = new BrowserWindow
    width: 1200
    height: 600
  window.loadUrl "file://#{__dirname}/GHCacheViews.html"
  window.on 'close', ->
    EventBus.emit 'close-window', window
    delete windows[window.id]
  windows[window.id] = window
  EventBus.emit 'open-window', window

RemoteRepositoryStore.on 'change', ->
  do createWindow

module.exports = instance
