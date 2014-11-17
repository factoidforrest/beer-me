define([], function() {
  var methods;
  methods = {
    getLocations: function(collection, bounds) {
      return collection.get('locations').fetch({
        data: {
          box: {
            leftLat: bounds._southWest.lat,
            rightLat: bounds._northEast.lat,
            topLng: bounds._northEast.lng,
            bottomLng: bounds._southWest.lng
          }
        },
        type: 'POST',
        processData: true
      });
    }
  };
  return methods;
});
