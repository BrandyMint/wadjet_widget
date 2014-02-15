define ['marionette', 'templates/result' ], (Marionette, template) ->
  class ResultView extends Marionette.ItemView
    tagName: 'li'
    className: 'wadjet-result'
    template: template

