define [ 'underscore', 'backbone', 'stickit' ], (_, Backbone, Stickit) ->
  'use strict'

  class QueryModel extends Backbone.Model
    defaults:
      query: 'test model content'
