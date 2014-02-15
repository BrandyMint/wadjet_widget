define ['backbone', 'templates/metaline'], (Backbone, template) ->
  class MetalineView extends Backbone.View
    render: ->
      @$el.html template(@model.toJSON())
      @
