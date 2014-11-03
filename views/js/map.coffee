define ["goog!maps,3"] , ->
	class Map
		constructor: ()->
			self = this
			console.log("map initializing")
			mapCanvas = document.getElementById('map_canvas')
			mapOptions =
	      center: new google.maps.LatLng(45.5000, -73.5667), #montreal
	      zoom: 8,
	      mapTypeId: google.maps.MapTypeId.ROADMAP

			map = new google.maps.Map(mapCanvas, mapOptions)
			this.map = map
			# Browser doesn't support Geolocation
			handleNoGeolocation = (errorFlag) ->
			  if errorFlag is true
			    console.log "Geolocation service encountered error"
			    
			  else
			    console.log "Your browser doesn't support geolocation"
			  #montreal = new google.maps.LatLng(45.5000, 73.5667)
			  #map.setCenter montreal
			  return

			#set center of map to user location
			if navigator.geolocation
			  browserSupportFlag = true
			  navigator.geolocation.getCurrentPosition ((position) ->
			    initialLocation = new google.maps.LatLng(position.coords.latitude, position.coords.longitude)
			    map.setCenter initialLocation
			    return
			  ), ->
			    handleNoGeolocation browserSupportFlag
			    return

			else
			  browserSupportFlag = false
			  handleNoGeolocation browserSupportFlag
	return Map