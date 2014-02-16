(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['marionette', 'views/result', 'views/empty_results'], function(Marionette, ResultView, EmptyResultsView) {
    var ResultsView, _ref;
    return ResultsView = (function(_super) {
      __extends(ResultsView, _super);

      function ResultsView() {
        _ref = ResultsView.__super__.constructor.apply(this, arguments);
        return _ref;
      }

      ResultsView.prototype.tagName = 'ul';

      ResultsView.prototype.id = 'wadjet-results-list';

      ResultsView.prototype.itemView = ResultView;

      ResultsView.prototype.emptyView = EmptyResultsView;

      ResultsView.prototype.onAfterItemAdded = function() {
        return this.$el.fadeIn();
      };

      ResultsView.prototype.onCollectionRendered = function() {
        return this.$el.hide();
      };

      return ResultsView;

    })(Marionette.CollectionView);
  });

}).call(this);
