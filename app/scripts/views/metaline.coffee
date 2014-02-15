define ['marionette', 'templates/metaline'], (Marionette, template) ->
  class MetalineView extends Marionette.ItemView
    template: -> template()
    bindings:
      '#metasearch-query': 'query'
    onRender: ->
      @stickit()
