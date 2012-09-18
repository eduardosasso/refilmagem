Movie = require './movie'

jsdom = require("jsdom")

class MovieParser
	_movies = []
	constructor: (url) ->
		@scrape url

	scrape: (url) ->
		jsdom.env
		  html: url
		  scripts: [ "http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js" ]
		  done: (errors, window) =>
		  	# expose errors somewhere
		    @parse window.$

	addMovie: (name, showtimes) ->
		_movies.push new Movie(name, showtimes)

	print: ->
		console.log _movies

	@example: ->

	parse: ($) ->

module.exports = MovieParser