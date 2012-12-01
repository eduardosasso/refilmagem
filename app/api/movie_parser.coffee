Movie = require './movie'
jsdom = require 'jsdom'
request = require 'request'

class MovieParser
	constructor: (url, cb) ->
		# instance variable
		@_movies = []
		@scrape(url,cb)

	scrape: (url,cb) ->
		request({uri: url, encoding: 'binary'}, (error, response, body) =>
			jsdom.env
			  html: body
			  scripts: [ "http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js" ]
			  done: (errors, window) =>
			  	# expose errors somewhere
			  	@parse(window.$)
			  	cb(@_movies)
		)
	addMovie: (name, showtimes) ->
		@_movies.push(new Movie(name, showtimes))

	# class method
	@example: ->

	parse: ($) ->

module.exports = MovieParser