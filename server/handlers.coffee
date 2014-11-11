##sass = require('node-sass')
##fs = require('fs')

module.exports = 
	root: (req, res) ->
		#section = req.param "section"
		section = "main"
		res.render('root.jade', {section: section})
	

	locations: (req, res) ->
		console.log("the request query is: ", req.query)
		console.log("the request body is:", req.body)

		box = req.body.box

		Location = db.models.location

		Location.where({})
		.query('whereBetween','lat', [box.leftLat, box.rightLat])
		.query('whereBetween','lng', [box.topLng, box.bottomLng])
		.fetchAll().then (locations) ->

			res.json({data: "nothing"})