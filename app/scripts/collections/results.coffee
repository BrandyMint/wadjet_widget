define [ 'underscore', 'backbone', 'models/result' ], (_, Backbone, ResultModel) ->
  'use strict'

  class ResultsCollection extends Backbone.Collection
    model: ResultModel

