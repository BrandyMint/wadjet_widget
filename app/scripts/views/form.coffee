define ['marionette', 'templates/form'], (Marionette, template) ->
  class FormView extends Marionette.ItemView
    tagName: 'form'
    id: 'wadjet-form'
    template: template
    bindings:
      '#wadjet-form-query': 'query'

    onRender: ->
      @stickit()
