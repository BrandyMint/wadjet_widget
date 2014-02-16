(function() {
  define(['jquery', 'underscore'], function($, _) {
    return function(context) {
      var render;
      render = function() {
        var $c, $e, $o;
        $e = function(text, escape) {
          return ("" + text).replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/'/g, '&#39;').replace(/\//g, '&#47;').replace(/"/g, '&quot;');
        };
        $c = function(text) {
          switch (text) {
            case null:
            case void 0:
              return '';
            case true:
            case false:
              return '' + text;
            default:
              return text;
          }
        };
        $o = [];
        $o.push("<h3>another test</h3>\n<p>" + ($e($c(this.another_content))) + "</p>");
        return $o.join("\n").replace(/\s([\w-]+)='true'/mg, ' $1').replace(/\s([\w-]+)='false'/mg, '');
      };
      return render.call(context);
    };
  });

}).call(this);
