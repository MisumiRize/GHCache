app = require 'app'
EventBus = require './EventBus'
GHCacheViews = require './GHCacheViews'

app.on 'ready', ->
  require './ShortcutView'
  
  GHCacheViews.on 'close', (id) ->
    EventBus.emit 'window-close', id
