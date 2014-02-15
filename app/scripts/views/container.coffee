define ['backbone', 'templates/container'], (Backbone, template) ->
  class ContainerView extends Backbone.View
    render: ->
      @$el.html template() #(@model.toJSON())
      @
