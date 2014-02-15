define ['marionette', 'templates/layout'], (Marionette, template) ->
  class Layout extends Marionette.Layout
    id: 'wadjet-layout'
    template: -> template()

    regions:
      form:     '#wadjet-form-container'
      results:  '#wadjet-results-container'
