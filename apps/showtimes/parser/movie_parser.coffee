jsdom = require 'jsdom'
request = require 'request'
colors = require 'colors'
MovieShowtimes = require '../movie_showtimes'

class MovieParser
	constructor: (url, cb) ->
		# instance variable
		@_movies = []
		@scrape(url,cb)

	scrape: (url,cb) ->
		start = new Date().getTime()
		request({uri: url, encoding: 'binary'}, (error, response, body) =>
			if error
				cb(error)
				return

			jsdom.env
			  html: body
			  scripts: [ "http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js" ]
			  done: (errors, window) =>
			  	if errors
			  		cb(errors)
			  	else
				  	@parse(window.$)
				  	benchmark = (new Date().getTime()) - start
				  	cb(null, @_movies, benchmark)
		)
	addMovie: (name, showtimes, subtitle, _3d) ->
		@_movies.push(new MovieShowtimes(name, showtimes, subtitle, _3d))

	@example_url: ->

	# class method
	@example: ->
		parser =  this.name
		url = this.example_url()
		new this(url, (error, movies, benchmark) ->
			if error
				console.log error
			else
				console.log JSON.stringify(movies, null, 2)
				console.log "Execution time: #{benchmark}ms".bold.green
		)

	parse: ($) ->

module.exports = MovieParser