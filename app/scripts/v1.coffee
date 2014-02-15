#/*global require*/
'use strict'

require.config
  shim:
    underscore:
      exports: '_'
    backbone:
      deps: [
        'underscore'
        'jquery'
      ]
      exports: 'Backbone'
    bootstrap:
      deps: ['jquery'],
      exports: 'jquery'
  baseUrl: 'scripts/'
  paths:
    all: '.'
    jquery: '../bower_components/jquery/jquery'
    backbone: '../bower_components/backbone/backbone'
    underscore: '../bower_components/underscore/underscore'
    bootstrap: '../bower_components/sass-bootstrap/dist/js/bootstrap'

require ['app'], (App) ->
  # TODO избавиться от загрузки в лагловке
  unless window.MetaSearchSettings?
    console.log "Не установлен window.MetaSearchSettings"
  app = new App()
  app.initialize window.MetaSearchSettings
