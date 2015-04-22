{EventEmitter} = require 'events'
EventBus = require './EventBus'

localRepos = {}
windowIDs = []
listeners = {}

addVCS = (vcs) ->
  path = vcs.repository.url.path
  localRepos[path] = vcs

class LocalRepositoryStore extends EventEmitter
  getAll: ->
    localRepos

  getByPath: (path) ->
    localRepos[path]

instance = new LocalRepositoryStore

EventBus.on 'new-local-repository', (payload) ->
  addVCS payload
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
