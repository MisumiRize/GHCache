{EventEmitter} = require 'events'
EventBus = require './EventBus'

remoteRepos = []
windowIDs = []
listeners = {}

addRepo = (repo) ->
  remoteRepos.push repo

class RemoteRepositoryStore extends EventEmitter
  getAll: ->
    remoteRepos

  getLast: ->
    remoteRepos[remoteRepos.length - 1]

instance = new RemoteRepositoryStore

EventBus.on 'new-remote-repository', (payload) ->
  addRepo payload
  instance.emit 'change'

EventBus.on 'open-window', (window) ->
  windowIDs.push window.id

EventBus.on 'close-window', (window) ->
  if listener = listeners[window.id]
    instance.removeListener 'change', listener

instance.on 'newListener', (event, listener) ->
  if windowID = do windowIDs.pop
    listeners[windowID] = listener
    windowID = null

module.exports = instance
