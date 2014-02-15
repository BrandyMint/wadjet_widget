define ['marionette', 'views/result', 'views/empty_results'], (Marionette, ResultView, EmptyResultsView) ->
  class ResultsView extends Marionette.CollectionView
    itemView: ResultView
    emptyView: EmptyResultsView
