define(["goog!maps,3"], function() {
  var Map;
  Map = (function() {
    function Map() {
      var browserSupportFlag, handleNoGeolocation, map, mapCanvas, mapOptions, self;
      self = this;
      console.log("map initializing");
      mapCanvas = document.getElementById('map_canvas');
      mapOptions = {
        center: new google.maps.LatLng(45.5000, -73.5667),
        zoom: 8,
        mapTypeId: google.maps.MapTypeId.ROADMAP
      };
      map = new google.maps.Map(mapCanvas, mapOptions);
      this.map = map;
      handleNoGeolocation = function(errorFlag) {
        var montreal;
        if (errorFlag === true) {
          console.log("Geolocation service encountered error");
        } else {
          console.log("Your browser doesn't support geolocation");
        }
        montreal = new google.maps.LatLng(45.5000, 73.5667);
      };
      if (navigator.geolocation) {
        browserSupportFlag = true;
        navigator.geolocation.getCurrentPosition((function(position) {
          var initialLocation;
          initialLocation = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
          map.setCenter(initialLocation);
        }), function() {
          handleNoGeolocation(browserSupportFlag);
        });
      } else {
        browserSupportFlag = false;
        handleNoGeolocation(browserSupportFlag);
      }
    }

    return Map;

  })();
  return Map;
});
