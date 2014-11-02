requirejs.config({
  waitSeconds: 15,
  paths: {
    jquery: ["components/jquery/dist/jquery.min"],
    bootstrap: ["components/bootstrap/dist/js/bootstrap.min"],
    async: ["components/requirejs-plugins/src/async"],
    propertyParser: ["components/requirejs-plugins/src/propertyParser"],
    goog: ["components/requirejs-plugins/src/goog"]
  },
  shim: {
    bootstrap: ["jquery"]
  }
});

require(["jquery", "bootstrap", "map"], function($, bs, Map) {
  var map;
  return map = new Map();
});
