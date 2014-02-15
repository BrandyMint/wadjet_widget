define ['marionette', 'templates/form'], (Marionette, template) ->
  class FormView extends Marionette.ItemView
    template: template
    bindings:
      '#wadget-form-query': 'query'
    onRender: ->
      @stickit()
