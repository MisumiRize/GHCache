React = require 'react'
LocalRepositoryListItem = require './LocalRepositoryListItem'

class LocalRepositorySection extends React.Component
  render: ->
    {repos} = @props
    reposToRender = Object.keys(repos).map (repo) ->
      React.createElement LocalRepositoryListItem,
        repo: repos[repo]
        key: repo

    React.createElement 'ul',
        id: 'local-repository-section'
      , reposToRender

module.exports = LocalRepositorySection
