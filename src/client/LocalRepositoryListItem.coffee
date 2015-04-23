React = require 'react'
shell = require 'shell'
path = require 'path'

class LocalRepositoryListItem extends React.Component
  _onClick: ->
    console.log @props.repo.repository.root
    dest = path.join @props.repo.repository.root, 'github.com', @props.repo.repository.url.path
    shell.showItemInFolder dest

  render: ->
    React.createElement 'li',
        onClick: @_onClick.bind @
      , @props.repo.repository.url.path

module.exports = LocalRepositoryListItem
