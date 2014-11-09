adapters = require('../knexfile')
locationModel = require('./models/location')

class Database
	constructor: () ->
		@knex = require('knex')(adapters.development)
		@bookshelf = require('bookshelf')(@knex)
		#console.log(@bookshelf)
		@models = {
			location: locationModel(@bookshelf)
		}







module.exports = Database