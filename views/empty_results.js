(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['marionette', 'templates/empty_results'], function(Marionette, template) {
    var EmptyResultsView, _ref;
    return EmptyResultsView = (function(_super) {
      __extends(EmptyResultsView, _super);

      function EmptyResultsView() {
        _ref = EmptyResultsView.__super__.constructor.apply(this, arguments);
        return _ref;
      }

      EmptyResultsView.prototype.id = 'wadjet-results-empty';

      EmptyResultsView.prototype.template = template;

      return EmptyResultsView;

    })(Marionette.ItemView);
  });

}).call(this);
