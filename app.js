(function() {
  define(['jquery', 'mousetrap', 'marionette', 'views/layout', 'views/form', 'models/query', 'collections/results', 'views/results', 'controllers/requester'], function($, Mousetrap, Marionette, Layout, FormView, QueryModel, ResultsCollection, ResultsView, Requester) {
    var app;
    app = new Marionette.Application;
    app.addInitializer(function(options) {
      var $body, form_view, layout, results_view, saved_body;
      app.results = new ResultsCollection;
      app.results.url = options.api_url || '/results.json';
      app.form_object = new QueryModel;
      $body = $('body');
      $body.addClass('wadjet-body');
      saved_body = $body.children().clone(true);
      $body.html('<div id="wadjet-site-body"></div');
      layout = new Layout;
      $body.prepend(layout.render().$el);
      $body.find('#wadjet-site-body').append(saved_body);
      form_view = new FormView({
        model: app.form_object
      });
      results_view = new ResultsView({
        collection: app.results
      });
      layout.form.show(form_view);
      layout.results.show(results_view);
      app.requester = new Requester({
        form_object: app.form_object,
        results: app.results,
        key: options.key
      });
      return Mousetrap.bind('esc', function() {
        app.results.reset([]);
        return app.form_object.set('query', '');
      });
    });
    return app.on("initialize:after", function() {
      var css_link, source;
      source = '/styles/widget.css';
      css_link = document.createElement("link");
      css_link.rel = "stylesheet";
      css_link.media = "screen, projection";
      css_link.type = "text/css_link";
      css_link.href = source;
      return $('head').append(css_link);
    });
  });

}).call(this);
