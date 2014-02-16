(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['underscore', 'backbone'], function(_, Backbone) {
    'use strict';
    var ResultModel, _ref;
    return ResultModel = (function(_super) {
      __extends(ResultModel, _super);

      function ResultModel() {
        _ref = ResultModel.__super__.constructor.apply(this, arguments);
        return _ref;
      }

      return ResultModel;

    })(Backbone.Model);
  });

}).call(this);
