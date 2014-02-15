define ['mousetrap', 'marionette', 'templates/form'], (Mousetrap, Marionette, template) ->
  class FormView extends Marionette.ItemView
    tagName: 'form'
    id: 'wadjet-form'
    template: template
    bindings:
      '#wadjet-form-query':
        observe: 'query'

    events:
      'keyup input'  : 'onKeyup'
      'click button' : 'onSubmit'

    onSubmit: (e) =>
      @model.trigger 'submit'
      @model.trigger 'change'
      e.preventDefault()
      return false

    onKeyup: (e) =>
      Mousetrap.trigger 'esc' if e.which == 27

    onRender: ->
      @stickit()
