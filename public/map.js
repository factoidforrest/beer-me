define(["goog!maps,3"], function() {
  var Map;
  Map = (function() {
    function Map() {
      var map, mapCanvas, mapOptions;
      console.log("map initializing");
      mapCanvas = document.getElementById('map_canvas');
      mapOptions = {
        center: new google.maps.LatLng(44.5403, -78.5463),
        zoom: 8,
        mapTypeId: google.maps.MapTypeId.ROADMAP
      };
      map = new google.maps.Map(mapCanvas, mapOptions);
    }

    return Map;

  })();
  return Map;
});
