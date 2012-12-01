jsdom = require 'jsdom'
request = require 'request'
colors = require 'colors'
Movie = require './movie'

class MovieParser
	constructor: (url, cb) ->
		# instance variable
		@_movies = []
		@scrape(url,cb)

	scrape: (url,cb) ->
		start = new Date().getTime()
		request({uri: url, encoding: 'binary'}, (error, response, body) =>
			jsdom.env
			  html: body
			  scripts: [ "http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js" ]
			  done: (errors, window) =>
			  	# expose errors somewhere
			  	@parse(window.$)
			  	benchmark =  (new Date().getTime()) - start
			  	cb(@_movies, benchmark)
		)
	addMovie: (name, showtimes) ->
		@_movies.push(new Movie(name, showtimes))

	@example_url: ->

	# class method
	@example: ->
		parser =  this.name
		url = this.example_url()
		new this(url, (movies, benchmark) ->
			console.log JSON.stringify(movies, null, 2)
			console.log "Execution time: #{benchmark}ms".bold.green
		)

	parse: ($) ->

module.exports = MovieParser