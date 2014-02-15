define ['jquery', 'mousetrap', 'marionette', 'views/layout', 'views/form', 'models/query', 'collections/results', 'views/results',
  'controllers/requester'],
  ($, Mousetrap, Marionette, Layout, FormView, QueryModel, ResultsCollection, ResultsView,
  Requester) ->
    app = new Marionette.Application
    app.addInitializer (options) ->
      app.results = new ResultsCollection
      app.results.url = options.api_url || '/results.json'
      app.form_object = new QueryModel

      $body = $('body')
      $body.addClass 'wadjet-body'
      saved_body = $body.children().clone true

      $body.html '<div id="wadjet-site-body"></div'

      layout = new Layout
      $body.prepend layout.render().$el

      # TODO Скопировать все стили из body
      $body.find('#wadjet-site-body').append saved_body

      form_view = new FormView model: app.form_object
      results_view = new ResultsView collection: app.results

      layout.form.show form_view
      layout.results.show results_view

      app.requester = new Requester
        form_object: app.form_object
        results:     app.results
        key:         options.key

      Mousetrap.bind 'esc', ->
        app.results.reset []
        app.form_object.set 'query', ''

    app.on "initialize:after", ->
      source = '/styles/widget.css'
      css_link = document.createElement "link"
      css_link.rel = "stylesheet"
      css_link.media = "screen, projection"
      css_link.type = "text/css_link"
      css_link.href = source
      $('head').append css_link
        # TODO fetch json?

    window.Wadjet = app
