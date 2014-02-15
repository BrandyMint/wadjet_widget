define ['jquery', 'views/container'], ($, ContainerView) ->
  class App
    initialize: (options) ->
      container = new ContainerView
      $('body').prepend container.render().$el

      #container.show new MetalineView.new
