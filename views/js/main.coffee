
requirejs.config
  waitSeconds : 15
  paths:
    
    # Load jquery from google cdn. On fail, load local file. 
    #jquery: [["//ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min"], "libs/jquery-min"]
    jquery: ["components/jquery/dist/jquery.min"]

    # Load bootstrap from cdn. On fail, load local file. 
    #bootstrap: [["//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min"], "libs/bootstrap-min"]
    bootstrap: ["components/bootstrap/dist/js/bootstrap.min"]
    async: ["components/requirejs-plugins/src/async"]
    propertyParser: ["components/requirejs-plugins/src/propertyParser"]
    goog: ["components/requirejs-plugins/src/goog"]
  shim:
    
    # Set bootstrap dependencies (just jQuery) 
    bootstrap: ["jquery"]
    #goog: ["propertyparser", "async"]

require [
  "jquery"
  "bootstrap"
  "map"
], ($, bs, Map) ->
  map = new Map()
