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
      deps: ['jquery', 'underscore', 'backbone', 'backbone.babysitter']
      exports: 'Marionette'
    stickit:
      deps: ['jquery', 'underscore', 'backbone']
      exports: 'Stickit'
    # http://stackoverflow.com/questions/16852101/how-to-load-backbone-babysitter
    'backbone.babysitter': 
      deps: ['backbone', 'underscore']
      exports: 'Backbone.Babysitter'

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
    'backbone.babysitter': '../bower_components/Backbone.BabySitter/lib/amd/backbone.babysitter'

require ['app'], (app) ->
  # TODO избавиться от загрузки в лагловке
  unless window.WadjetSettings?
    console.log "!!! Не установлен window.MetaSearchSettings"

  app.start window.WadjetSettings
  window.Wadjet = app

#require ['backbone.babysitter'], ->
  #v = new Backbone.ChildViewContainer()
