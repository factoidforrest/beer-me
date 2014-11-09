adapters = require('../knexfile')
locationModel = require('./models/location')

env = process.env.NODE_ENV || "development"

#JS metaprogramming sucks
adapter = {
	"development": adapters.development
	"test": adapters.test
	"production": adapters.production
}

class Database
	constructor: () ->
		@knex = require('knex')(adapter[env])
		@bookshelf = require('bookshelf')(@knex)
		#console.log(@bookshelf)
		@models = {
			location: locationModel(@bookshelf)
		}







module.exports = Database