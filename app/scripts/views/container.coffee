define ['marionette', 'templates/container'], (Marionette, template) ->
  class ContainerLayout extends Marionette.Layout
    id: 'metasearch_widget_layout'
    template: -> template()

    regions:
      metaline: '#metasearch_metaline'
      results:  '#metasearch_results'

      #initialize: (options) ->

    #render: ->
      #@$el.html template() #(@model.toJSON())
      #@$el.
      #@
