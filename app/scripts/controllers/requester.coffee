define ['jquery', 'marionette'],
  ($, Marionette) ->
    class Requester extends Marionette.Controller
      initialize: (options) ->
        { @form_object, @results, @key } = options

        @listenTo @form_object, 'change', @_update

      _update: ->
        @results.fetch
          data:
            q: @form_object.get('query')
            key: @key
          error: (a,b) ->
            console.log 'Ошибка получения данных', a, b

