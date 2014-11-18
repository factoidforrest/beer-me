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

		box = req.body.box
		console.log('the box is ', box)
		Location = db.models.location

		Location.findInBox(box).then (locations) ->
			console.log('got ', locations.size(), ' locations')
			res.json(locations.toJSON)
