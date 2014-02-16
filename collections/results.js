(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['underscore', 'backbone', 'models/result'], function(_, Backbone, ResultModel) {
    'use strict';
    var ResultsCollection, _ref;
    return ResultsCollection = (function(_super) {
      __extends(ResultsCollection, _super);

      function ResultsCollection() {
        _ref = ResultsCollection.__super__.constructor.apply(this, arguments);
        return _ref;
      }

      ResultsCollection.prototype.model = ResultModel;

      ResultsCollection.prototype.parse = function(data) {
        this.total = data.total;
        if (_.isObject(data.results)) {
          return data.results;
        } else {
          return data;
        }
      };

      return ResultsCollection;

    })(Backbone.Collection);
  });

}).call(this);
