define ['jquery', 'marionette'],
  ($, Marionette) ->
    class Requester extends Marionette.Controller
      initialize: (options) ->
        { @form_object, @results, @key } = options

        @listenTo @form_object, 'change', @_update

      _update: ->
        query = @form_object.get('query')
        if query.length==0
          @results.reset()
        else
          @results.fetch
            data:
              q: query
              key: @key
            error: (a,b) ->
              console.log '!!! Ошибка получения результатов', a, b
