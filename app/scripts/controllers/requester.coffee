define ['jquery', 'marionette', 'spinjs'],
  ($, Marionette, Spinner) ->
    class Requester extends Marionette.Controller
      initialize: (options) ->
        { @form_object, @results, @key } = options

        @listenTo @form_object, 'submit', @_update
        @listenTo @form_object, 'change', @_update

        @$s = $ '#wadjet-spinner'

      _update: ->
        console.log 'get results'
        spinner_opts = 
          length: 5
          radius: 4
          width: 1
          color: '#fff'
          shadow: false

        #@spinner?.stop()
        #if @spinner
          #@spinner.spin()
        #else
          #@spinner = new Spinner(spinner_opts).spin()
          #@$s.append @spinner.el

        query = @form_object.get('query')
        if query.length==0
          @results.reset()
        else
          @results.fetch
            data:
              q: query
              key: @key
            complete: ->
              # @spinner.stop()

            error: (a,b) ->
              console.log '!!! Ошибка получения результатов', a, b
