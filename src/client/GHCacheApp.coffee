React = require 'react'
requireRemote = require('remote').require
RemoteRepositoryStore = requireRemote './src/RemoteRepositoryStore'
LocalRepositoryStore = requireRemote './src/LocalRepositoryStore'

class GHProxyApp extends React.Component
  @defaultProps:
    src: do RemoteRepositoryStore.getLast

  _onChange: ->
    console.log 'changed'

  componentDidMount: ->
    LocalRepositoryStore.on 'change', @_onChange.bind @
    RemoteRepositoryStore.on 'change', @_onChange.bind @

  componentWillUnmount: ->
    console.log 'unmount'
    LocalRepositoryStore.removeListener 'change', @_onChange.bind @
    RemoteRepositoryStore.removeListener 'change', @_onChange.bind @

  render: ->
    React.createElement 'div', null,
      React.createElement 'webview', src: @props.src

module.exports = GHProxyApp
