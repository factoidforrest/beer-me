requirejs.config({
  waitSeconds: 15,
  paths: {
    jquery: ["components/jquery/dist/jquery.min"],
    bootstrap: ["components/bootstrap/dist/js/bootstrap.min"],
    async: ["components/requirejs-plugins/src/async"]
  },
  shim: {
    bootstrap: ["jquery"]
  }
});

require(["jquery", "bootstrap", "map"], function($, bs, Map) {
  return window.mapAPI = new Map();
});
