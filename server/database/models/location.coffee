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

		initalize: () ->
			return

		ratings: () ->
	    #return this.hasMany(Ratings)
	  

	})
	return Location
