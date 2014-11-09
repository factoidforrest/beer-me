chai = require('chai')
app = require('./../server')
db = app.get('db')
describe 'location', ->
	describe 'creation', ->
		before (done) ->
			db.models.location.forge({
				title:'bla'
				type:'bla'
				description:'bla'
				lat: 0
				lng: 0
			}).save().then -> 
				done()
		it 'should be a valid location', ->
			return true

