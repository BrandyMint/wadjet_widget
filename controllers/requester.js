(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['jquery', 'marionette', 'spinjs'], function($, Marionette, Spinner) {
    var Requester, _ref;
    return Requester = (function(_super) {
      __extends(Requester, _super);

      function Requester() {
        _ref = Requester.__super__.constructor.apply(this, arguments);
        return _ref;
      }

      Requester.prototype.initialize = function(options) {
        this.form_object = options.form_object, this.results = options.results, this.key = options.key;
        this.listenTo(this.form_object, 'submit', this._update);
        this.listenTo(this.form_object, 'change', this._update);
        return this.$s = $('#wadjet-spinner');
      };

      Requester.prototype._update = function() {
        var query, spinner_opts;
        console.log('get results');
        spinner_opts = {
          length: 5,
          radius: 4,
          width: 1,
          color: '#fff',
          shadow: false
        };
        query = this.form_object.get('query');
        if (query.length === 0) {
          return this.results.reset();
        } else {
          return this.results.fetch({
            data: {
              q: query,
              key: this.key
            },
            complete: function() {},
            error: function(a, b) {
              return console.log('!!! Ошибка получения результатов', a, b);
            }
          });
        }
      };

      return Requester;

    })(Marionette.Controller);
  });

}).call(this);
