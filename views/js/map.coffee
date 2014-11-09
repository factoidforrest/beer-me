#define ["goog!maps,3"] , ->
define ['async!http://maps.google.com/maps/api/js?key=AIzaSyDlRf_zcIM-9i1D1cbioaBLQrsRbxsM4lE&libraries=places'] , ->

	class Map

		constructor: ()->
			self = this
			console.log("map initializing")
			mapCanvas = document.getElementById('map_canvas')
			mapOptions =
				center: new google.maps.LatLng(45.5000, -73.5667), #montreal
				zoom: 8,
				mapTypeId: google.maps.MapTypeId.ROADMAP

			@map = map = new google.maps.Map(mapCanvas, mapOptions)
			



			#set center of map to user location
			@autoLocate()

		autoLocate: () ->
			self = this #must be a cleaner way to get variables into the inner function than this
			if navigator.geolocation
				browserSupportFlag = true
				navigator.geolocation.getCurrentPosition ((position) ->
					initialLocation = new google.maps.LatLng(position.coords.latitude, position.coords.longitude)
					self.map.setCenter initialLocation
					self.map.setZoom(15)
					self.showUserLocationMarker(position)
					return
				), ->
					handleNoGeolocation browserSupportFlag
					return

			else
				browserSupportFlag = false
				handleNoGeolocation browserSupportFlag
	

		showUserLocationMarker: (pos) ->
			marker = @userLocationMarker = 
				new google.maps.Marker(
					clickable: false
					icon: new google.maps.MarkerImage("//maps.gstatic.com/mapfiles/mobile/mobileimgs2.png", new google.maps.Size(22, 22), new google.maps.Point(0, 18), new google.maps.Point(11, 11))
					shadow: null
					zIndex: 999
					map: @map
				)

			placeMarker(marker, pos)
			
			#update when position changes

			navigator.geolocation.watchPosition (newPosition) ->
				placeMarker(marker, newPosition)

	return Map


handleNoGeolocation = (errorFlag) ->
	if errorFlag is true
		console.log "Geolocation service encountered error"
		
	else
		console.log "Your browser doesn't support geolocation"
	#montreal = new google.maps.LatLng(45.5000, 73.5667)
	#map.setCenter montreal
	return


placeMarker = (marker, pos) ->
	latLng = new google.maps.LatLng(pos.coords.latitude, pos.coords.longitude)
	marker.setPosition latLng

