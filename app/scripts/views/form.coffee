define ['mousetrap', 'marionette', 'templates/form'], (Mousetrap, Marionette, template) ->
  class FormView extends Marionette.ItemView
    tagName: 'form'
    id: 'wadjet-form'
    template: template
    bindings:
      '#wadjet-form-query': 'query'
    events:
      'keyup input' : 'onKeyup'

    onKeyup: (e) =>
      Mousetrap.trigger 'esc' if e.which == 27

    onRender: ->
      @stickit()
