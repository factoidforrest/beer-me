##sass = require('node-sass')
##fs = require('fs')

db = require('./database/database')


module.exports = 
	root: (req, res) ->
		#section = req.param "section"
		section = "main"
		res.render('root.jade', {section: section})
	
	#move core logic here to another file, perhaps even the location model,and pass it a callback which takes locations as arg
	locations: (req, res) ->
		console.log("the request query is: ", req.query)
		console.log("the request body is:", req.body)

		box = req.body.box
		console.log('the box is ', box)
		Location = db.models.location

		Location
		#.query('whereBetween','lat', [box.leftLat, box.rightLat])
		#.query('whereBetween','lng', [box.topLng, box.bottomLng])
		.fetchAll().then (locations) ->
			console.log("the fetched locations within map bounds is ", locations)
			console.log('the number of locs is ', locations.length)
			console.log("the first one as json is ",  locations[0])
			console.log("converted to json", locations.toJSON())

			res.json(locations.toJSON())