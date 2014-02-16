(function() {
  define(['jquery', 'underscore'], function($, _) {
    return function(context) {
      var render;
      render = function() {
        var $o;
        $o = [];
        $o.push("<input id='wadjet-form-query' placeholder='Я ищу..' autocomplete='off'>\n<button class='fa fa-search wadjet-fa-search'></button>\n<div id='wadjet-spinner'></div>");
        return $o.join("\n").replace(/\s(?:id|class)=(['"])(\1)/mg, "");
      };
      return render.call(context);
    };
  });

}).call(this);
