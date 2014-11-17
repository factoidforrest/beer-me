###
app = require('./../../server')


Location = app.get('db').bookshelf.Model.extend({
	tableName: 'locations'

	initalize: () ->
		return

	ratings: () ->
		#return this.hasMany(Ratings)
	

	})

module.exports = Location


###

#Location

module.exports = (bookshelf) ->
	Location = bookshelf.Model.extend({
		#instance methods

		tableName: 'locations'

		initialize: () ->
			console.log('initializing location model with attributes')
			console.log(this)
			return

		ratings: () ->
			#return this.hasMany(Ratings)
		
		toJSON: () ->
			self = this
			return {
				#"type": "Feature",
				"id": self.get('id')
				"title": self.get('title')
				"description": self.get('description')
				"coordinates": [self.get('lat'), self.get('lng')]
				
			}

	}, {
		#class methods
		console.log('firing query: ')
		console.log(knex('locations').whereBetween('lat',[box.leftLat, box.rightLat]).toSQL())
		this
		.query('whereBetween','lat', [box.leftLat, box.rightLat])
		.query('whereBetween','lng', [box.topLng, box.bottomLng])
		.fetchAll().then (locations) ->
			console.log("the fetched locations within map bounds is ", locations)
			console.log('the number of locs is ', locations.length)
			console.log("the first one as json is ",  locations[0])
			console.log("converted to json", locations.toJSON())

			res.json(locations.toJSON())
	})
	return Location
