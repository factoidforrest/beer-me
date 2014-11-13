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
		tableName: 'locations'

		initialize: () ->
			console.log('initializing location model with attributes')
			console.log(this.attributes)
			return

		ratings: () ->
			#return this.hasMany(Ratings)
		
		toJSON: () ->
			self = this
			return {
				"type": "Feature",
				"title": self.get('title')
				"description": self.get('description')
				"coordinates": [self.get('lat'), self.get('lng')]
				
			}

	})
	return Location
