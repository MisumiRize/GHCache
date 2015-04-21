VCSClone = require 'vcs-clone'
EventBus = require './EventBus'

module.exports =
  doClone: (url, path) ->
    EventBus.emit 'clone-start', url
    VCSClone.clone url, path, update: true
      .then (data) ->
        EventBus.emit 'new-local-repository', data
      .catch (err) ->
        EventBus.emit 'clone-error', err
