define [ 'underscore', 'backbone', 'models/result' ], (_, Backbone, ResultModel) ->
  'use strict'

  class ResultsCollection extends Backbone.Collection
    model: ResultModel
    parse: (data) ->
      @total = data.total
      if _.isObject data.results
        data.results
      else
        data
