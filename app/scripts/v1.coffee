#/*global require*/
'use strict'

require.config
  baseUrl: 'scripts/'
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
    marionette:
      deps: ['jquery', 'underscore', 'backbone']
      exports: 'Marionette'
    stickit:
      deps: ['jquery', 'underscore', 'backbone']
      exports: 'Stickit'
  paths:
    all: '.'
    jquery: '../bower_components/jquery/jquery'
    backbone: '../bower_components/backbone/backbone'
    underscore: '../bower_components/underscore/underscore'
    bootstrap: '../bower_components/sass-bootstrap/dist/js/bootstrap'
    marionette: '../bower_components/marionette/lib/backbone.marionette'
    stickit: '../bower_components/backbone.stickit/backbone.stickit'
    spinjs:    '../bower_components/spinjs/spin'
    mousetrap: '../bower_components/mousetrap/mousetrap'

require ['app'], (app) ->
  # TODO избавиться от загрузки в лагловке
  unless window.WadjetSettings?
    console.log "!!! Не установлен window.MetaSearchSettings"
  app.start window.WadjetSettings
