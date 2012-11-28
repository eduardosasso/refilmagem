MovieParser = require './movie_parser'

class GoogleMovies extends MovieParser
	parse: ($) ->
		that = this
		$(".showtimes .movie").each ->
			name = $('.name', this).text()
			showtimes = $.map($('.times', this).text().split('&nbsp'), (val) -> val.replace(/[^a-zA-Z0-9:\-]/g,''))
			that.addMovie(name, showtimes)

	addMovie: =>
		super

	@example: ->
		url = "http://www.google.com.br/movies?near=porto+alegre&tid=1f76f971434a044"
		new GoogleMovies(url, (movies) ->
			console.log movies
		)

module.exports = GoogleMovies