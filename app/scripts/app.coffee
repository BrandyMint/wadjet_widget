define ['jquery', 'marionette', 'views/layout', 'views/form', 'models/query', 'collections/results', 'views/results',
  'controllers/requester'],
  ($, Marionette, Layout, FormView, QueryModel, ResultsCollection, ResultsView,
  Requester) ->
    app = new Marionette.Application

    app.addInitializer (options) ->
      layout = new Layout
      $('body').prepend layout.render().$el

      results = new ResultsCollection url: '/results.json'
      form_object = new QueryModel

      form_view = new FormView model: form_object
      results_view = new ResultsView collection: results

      layout.form.show form_view
      layout.results.show results_view

      new Requester
        form_object: form_object
        results:     results
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

    app
