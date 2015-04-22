React = require 'react'
GHCacheApp = require './GHCacheApp'
CloneUtils = require('remote').require './src/CloneUtils'

app = React.render React.createElement(GHCacheApp), document.getElementById('react')

CloneUtils.doClone app.props.url.href, do process.cwd
