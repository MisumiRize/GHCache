{EventEmitter} = require 'events'
EventBus = require './EventBus'

remoteRepos = []

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

module.exports = instance
