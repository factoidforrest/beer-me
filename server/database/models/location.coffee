db = require('./../database')
knex = db.knex

module.exports = (bookshelf) ->
	Location = bookshelf.Model.extend({
		#instance methods

		tableName: 'locations'

		initialize: () ->
			this.set('created_at', Date.now())
			this.set('updated_at', Date.now())
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
		findInBox: (box) ->
			db = require('./../database')
			knex = db.knex
			console.log('firing query: ')

			#console.log(knex('locations').whereBetween('lat',[box.leftLat, box.rightLat]).toSQL())
			console.log('the query tosql is:' ,this.query('whereBetween','lat', [box.leftLat, box.rightLat]).query('whereBetween','lng', [box.topLng, box.bottomLng]).query().toSQL())
			resultPromise = this
			.query('whereBetween','lat', [box.leftLat, box.rightLat])
			.query('whereBetween','lng', [box.topLng, box.bottomLng])
			.fetchAll()
			return resultPromise
	})
	return Location
