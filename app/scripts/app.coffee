define ['jquery', 'marionette', 'views/layout', 'views/form', 'models/query', 'collections/results', 'views/results',
  'controllers/requester'],
  ($, Marionette, Layout, FormView, QueryModel, ResultsCollection, ResultsView,
  Requester) ->
    app = new Marionette.Application
    app.results = new ResultsCollection
    app.results.url = '/results.json'
    app.form_object = new QueryModel

    app.addInitializer (options) ->
      layout = new Layout
      $('body').prepend layout.render().$el

      form_view = new FormView model: app.form_object
      results_view = new ResultsView collection: app.results

      layout.form.show form_view
      layout.results.show results_view

      app.requester = new Requester
        form_object: app.form_object
        results:     app.results
        key:         options.key

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
