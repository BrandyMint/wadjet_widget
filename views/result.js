(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['marionette', 'templates/result'], function(Marionette, template) {
    var ResultView, _ref;
    return ResultView = (function(_super) {
      __extends(ResultView, _super);

      function ResultView() {
        _ref = ResultView.__super__.constructor.apply(this, arguments);
        return _ref;
      }

      ResultView.prototype.tagName = 'li';

      ResultView.prototype.className = 'wadjet-result';

      ResultView.prototype.template = template;

      return ResultView;

    })(Marionette.ItemView);
  });

}).call(this);
