Showtimes = require "./showtimes"
Movie = require './movie'

class GoogleMovies
	run: ($) ->
		movies = []
		
		$(".showtimes .movie").each ->
			name = $('.name', this).text()
			showtimes = $.map($('.times', this).text().split('&nbsp'), (val) -> val.replace(/[^a-zA-Z0-9:\-]/g,''))
			movies.push new Movie(name, showtimes)
		
		console.log movies
		return movies

module.exports = GoogleMovies