BrowserWindow = require 'browser-window'
{EventEmitter} = require 'events'
RemoteRepositoryStore = require './RemoteRepositoryStore'

instance = new EventEmitter
windows = {}
currentID = 0

createWindow = ->
  currentID++
  window = new BrowserWindow
    width: 800
    height: 600
  window.id = currentID
  window.loadUrl "file://#{__dirname}/GHCacheViews.html"
  window.on 'close', ->
    instance.emit 'close', window.id
    delete windows[window.id]
  windows[currentID] = window

RemoteRepositoryStore.on 'change', ->
  do createWindow
  instance.emit 'open', currentID

module.exports = instance
