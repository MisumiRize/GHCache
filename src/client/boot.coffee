React = require 'react'
GHCacheApp = require './GHCacheApp'
CloneUtils = require('remote').require './src/CloneUtils'

app = React.render React.createElement(GHCacheApp), document.getElementById('react')

webview = React.findDOMNode app
  .querySelector 'webview'
webview.addEventListener 'did-finish-load', ->
  CloneUtils.doClone 'https://github.com/MisumiRize/vcs-clone'
