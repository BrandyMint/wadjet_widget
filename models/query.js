(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['underscore', 'backbone', 'stickit'], function(_, Backbone, Stickit) {
    'use strict';
    var QueryModel, _ref;
    return QueryModel = (function(_super) {
      __extends(QueryModel, _super);

      function QueryModel() {
        _ref = QueryModel.__super__.constructor.apply(this, arguments);
        return _ref;
      }

      return QueryModel;

    })(Backbone.Model);
  });

}).call(this);
