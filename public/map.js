var handleNoGeolocation, placeMarker;

define(["goog!maps,3"], function() {
  var Map;
  Map = (function() {
    function Map() {
      var map, mapCanvas, mapOptions, self;
      self = this;
      console.log("map initializing");
      mapCanvas = document.getElementById('map_canvas');
      mapOptions = {
        center: new google.maps.LatLng(45.5000, -73.5667),
        zoom: 8,
        mapTypeId: google.maps.MapTypeId.ROADMAP
      };
      this.map = map = new google.maps.Map(mapCanvas, mapOptions);
      this.autoLocate();
    }

    Map.prototype.autoLocate = function() {
      var browserSupportFlag, self;
      self = this;
      if (navigator.geolocation) {
        browserSupportFlag = true;
        return navigator.geolocation.getCurrentPosition((function(position) {
          var initialLocation;
          initialLocation = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
          self.map.setCenter(initialLocation);
          self.showUserLocationMarker(position);
        }), function() {
          handleNoGeolocation(browserSupportFlag);
        });
      } else {
        browserSupportFlag = false;
        return handleNoGeolocation(browserSupportFlag);
      }
    };

    Map.prototype.showUserLocationMarker = function(pos) {
      var marker;
      marker = this.userLocationMarker = new google.maps.Marker({
        clickable: false,
        icon: new google.maps.MarkerImage("//maps.gstatic.com/mapfiles/mobile/mobileimgs2.png", new google.maps.Size(22, 22), new google.maps.Point(0, 18), new google.maps.Point(11, 11)),
        shadow: null,
        zIndex: 999,
        map: this.map
      });
      return navigator.geolocation.watchPosition(function(newPosition) {
        return placeMarker(marker, newPosition);
      });
    };

    return Map;

  })();
  return Map;
});

handleNoGeolocation = function(errorFlag) {
  if (errorFlag === true) {
    console.log("Geolocation service encountered error");
  } else {
    console.log("Your browser doesn't support geolocation");
  }
};

placeMarker = function(marker, pos) {
  var latLng;
  latLng = new google.maps.LatLng(pos.coords.latitude, pos.coords.longitude);
  return marker.setPosition(latLng);
};
