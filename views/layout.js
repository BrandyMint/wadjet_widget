(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['marionette', 'templates/layout'], function(Marionette, template) {
    var Layout, _ref;
    return Layout = (function(_super) {
      __extends(Layout, _super);

      function Layout() {
        _ref = Layout.__super__.constructor.apply(this, arguments);
        return _ref;
      }

      Layout.prototype.id = 'wadjet-layout';

      Layout.prototype.template = function() {
        return template();
      };

      Layout.prototype.regions = {
        form: '#wadjet-form-container',
        results: '#wadjet-results-container'
      };

      return Layout;

    })(Marionette.Layout);
  });

}).call(this);
