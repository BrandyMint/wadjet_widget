(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['mousetrap', 'marionette', 'templates/form'], function(Mousetrap, Marionette, template) {
    var FormView, _ref;
    return FormView = (function(_super) {
      __extends(FormView, _super);

      function FormView() {
        this.onKeyup = __bind(this.onKeyup, this);
        this.onSubmit = __bind(this.onSubmit, this);
        _ref = FormView.__super__.constructor.apply(this, arguments);
        return _ref;
      }

      FormView.prototype.tagName = 'form';

      FormView.prototype.id = 'wadjet-form';

      FormView.prototype.template = template;

      FormView.prototype.bindings = {
        '#wadjet-form-query': {
          observe: 'query'
        }
      };

      FormView.prototype.events = {
        'keyup input': 'onKeyup',
        'click button': 'onSubmit'
      };

      FormView.prototype.onSubmit = function(e) {
        this.model.trigger('submit');
        this.model.trigger('change');
        e.preventDefault();
        return false;
      };

      FormView.prototype.onKeyup = function(e) {
        if (e.which === 27) {
          return Mousetrap.trigger('esc');
        }
      };

      FormView.prototype.onRender = function() {
        return this.stickit();
      };

      return FormView;

    })(Marionette.ItemView);
  });

}).call(this);
