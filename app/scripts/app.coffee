define ['jquery', 'marionette', 'views/container', 'models/query', 'views/metaline'],
  ($, Marionette, ContainerLayout, QueryModel, MetalineView) ->
    app = new Marionette.Application

    app.addInitializer (options) ->
      layout = new ContainerLayout
      $('body').prepend layout.render().$el

      query = new QueryModel

      metaline_view = new MetalineView model: query

      layout.metaline.show metaline_view



    app.on "initialize:after", ->
      # TODO fetch json?

    app
