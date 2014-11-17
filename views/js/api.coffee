
define [], ()->
	methods = 
		getLocations: (collection, bounds)-> 
			collection.get('locations').fetch({ 
				data: {
					box : { 			
						leftLat: bounds._southWest.lat
						rightLat: bounds._northEast.lat
						topLng: bounds._northEast.lng
						bottomLng: bounds._southWest.lng
					}
				},
				type: 'POST',
				processData: true
			})
		
	
	return methods