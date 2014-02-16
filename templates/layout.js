(function() {
  define(['jquery', 'underscore'], function($, _) {
    return function(context) {
      var render;
      render = function() {
        var $o;
        $o = [];
        $o.push("<div id='wadjet-form-container'/>\n<div id='wadjet-results-container'/>");
        return $o.join("\n").replace(/\s(?:id|class)=(['"])(\1)/mg, "");
      };
      return render.call(context);
    };
  });

}).call(this);
