db = require('./../database')
knex = db.knex

module.exports = (bookshelf) ->
	Location = bookshelf.Model.extend({
		#instance methods

		tableName: 'locations'

		initialize: () ->
			#figure out how to set these on creating and updating events
			#this.set('created_at', knex.raw('now()'))
			#this.set('updated_at', knex.raw('now()'))
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
			console.log('query ranges are ', [box.bottomLat, box.topLat], [box.leftLng, box.rightLng])
			resultPromise = this
			.query('whereBetween','lat', [box.bottomLat, box.topLat])
			.query('whereBetween','lng', [box.leftLng, box.rightLng])
			.fetchAll()
			return resultPromise
	})
	return Location
