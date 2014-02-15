define ['marionette', 'templates/form'], (Marionette, template) ->
  class FormView extends Marionette.ItemView
    template: template
    bindings:
      '#wadjet-form-query': 'query'

    onRender: ->
      @stickit()
