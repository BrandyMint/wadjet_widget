define ['marionette', 'templates/empty_results' ], (Marionette, template) ->
  class EmptyResultsView extends Marionette.ItemView
    id: 'wadjet-results-empty'
    template: template
