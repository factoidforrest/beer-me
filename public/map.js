define(['leaflet', 'leaflet_locate', 'leaflet_geoip'], function() {
  var Map, locateOptions;
  Map = (function() {
    function Map() {
      var lc, map, self;
      self = this;
      console.log("map initializing");
      this.map = map = L.map('map').setView([51.505, -0.09], 11);
      L.GeoIP.centerMapOnPosition(map);
      lc = L.control.locate(locateOptions).addTo(map);
      lc.locate();
      L.tileLayer('http://{s}.tiles.mapbox.com/v3/light24bulbs.k6c8a0kc/{z}/{x}/{y}.png', {
        attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://mapbox.com">Mapbox</a>',
        maxZoom: 18
      }).addTo(map);
    }

    return Map;

  })();
  locateOptions = {
    position: "topleft",
    drawCircle: true,
    follow: true,
    setView: true,
    keepCurrentZoomLevel: true,
    maxZoom: 12,
    stopFollowingOnDrag: true,
    remainActive: true,
    markerClass: L.circleMarker,
    circleStyle: {},
    markerStyle: {},
    followCircleStyle: {},
    followMarkerStyle: {},
    icon: "fa fa-map-marker",
    iconLoading: "fa fa-spinner fa-spin",
    circlePadding: [0, 0],
    metric: true,
    onLocationError: function(err) {
      alert(err.message);
    },
    onLocationOutsideMapBounds: function(context) {
      alert(context.options.strings.outsideMapBoundsMsg);
    },
    showPopup: true,
    strings: {
      title: "Show me where I am",
      popup: "You are within {distance} {unit} from this point",
      outsideMapBoundsMsg: "You seem located outside the boundaries of the map"
    },
    locateOptions: {}
  };
  return Map;
});
