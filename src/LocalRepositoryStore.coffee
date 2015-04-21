{EventEmitter} = require 'events'
EventBus = require './EventBus'

localRepos = []

addRepo = (repo) ->
  localRepos.push repo

class LocalRepositoryStore extends EventEmitter
  getAll: ->
    localRepos

instance = new LocalRepositoryStore

EventBus.on 'new-local-repository', (payload) ->
  addRepo payload
  instance.emit 'change'

module.exports = instance
