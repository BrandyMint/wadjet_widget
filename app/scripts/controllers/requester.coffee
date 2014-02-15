define ['jquery', 'marionette'],
  ($, Marionette) ->
    class Requester extends Marionette.Controller
      initialize: (options) ->
        { @form_object, @results, @key } = options

        @listenTo @form_object, 'change', @_update

      _update: (model) ->
        debugger
        @results.fetch
          data:
            q: model.query
            key: @key

