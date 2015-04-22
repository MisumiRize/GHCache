React = require 'react'
url = require 'url'

requireRemote = require('remote').require
RemoteRepositoryStore = requireRemote './src/RemoteRepositoryStore'
LocalRepositoryStore = requireRemote './src/LocalRepositoryStore'

getStateFromStores = (url) ->
  localRepo: LocalRepositoryStore.getByPath url.path

class GHProxyApp extends React.Component
  @defaultProps:
    url: url.parse "https://github.com/#{RemoteRepositoryStore.getLast()}"

  state:
    getStateFromStores @defaultProps.url

  _onChange: ->
    @setState getStateFromStores @props.url

  componentDidMount: ->
    LocalRepositoryStore.on 'change', @_onChange.bind @
    RemoteRepositoryStore.on 'change', @_onChange.bind @

  componentWillUnmount: ->
    LocalRepositoryStore.removeListener 'change', @_onChange.bind @
    RemoteRepositoryStore.removeListener 'change', @_onChange.bind @

  render: ->
    local = if @state.localRepo then null else React.createElement 'i', className: 'medium mdi-notification-sync'

    React.createElement('div', null,
      React.createElement('div', {id: 'drawer-toggle-label'},
        React.createElement('i', {className: 'medium mdi-navigation-menu'})
      ),
      React.createElement('div', {id: 'sync-status'}, local),
      React.createElement('webview', {src: @props.url.href})
    )

module.exports = GHProxyApp
