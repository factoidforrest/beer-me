define(['backbone', 'leaflet'], function(Backbone, leaflet) {
  var Layer, Location, LocationCollection, LocationMarker;
  Location = Backbone.Model.extend({
    initialize: function() {
      var locationMarker;
      console.log('initializing: ');
      console.log(this);
      return locationMarker = new LocationMarker({
        model: this
      });
    }
  });
  LocationCollection = Backbone.Collection.extend({
    model: Location,
    url: 'locations',
    initialize: function() {
      console.log('initializing collection');
      console.log(this);
    },
    create: function(attributes, options) {}
  });
  Layer = Backbone.Model.extend({
    initialize: function() {
      var locations;
      locations = new LocationCollection;
      locations.layer = this;
      this.set({
        locations: locations
      });
      console.log('created layer model');
      return console.log(this);
    }
  });
  LocationMarker = Backbone.View.extend({
    tagName: "???",
    className: "???",
    events: {
      "click .icon": "open",
      "click .button.edit": "openEditDialog",
      "click .button.delete": "destroy"
    },
    initialize: function() {
      this.listenTo(this.model, "add", this.render);
      console.log('view intialized');
      this.render;
    },
    render: function() {
      var marker;
      console.log('rendering marker');
      marker = L.marker(this.model.get('coordinates'));
      return this.model.collection.layer.get('layerGroup').addLayer(marker);
    }
  });
  return Layer;
});
