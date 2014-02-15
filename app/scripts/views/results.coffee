define ['marionette', 'views/result', 'views/empty_results'], (Marionette, ResultView, EmptyResultsView) ->
  class ResultsView extends Marionette.CollectionView
    tagName: 'ul'
    id: 'wadjet-results-list'
    itemView: ResultView
    emptyView: EmptyResultsView
