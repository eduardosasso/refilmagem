MovieParser = require './movie_parser'

class GoogleMovies extends MovieParser
	parse: ($) ->
		self = this
		$(".showtimes .movie").each ->
			name = $('.name', this).text()
			showtimes = $.map($('.times', this).text().split('&nbsp'), (val) -> val.replace(/[^a-zA-Z0-9:\-]/g,''))
			self.addMovie(name, showtimes)

	addMovie: ->
		super

	print: ->
		super

	@example: ->
		g = new GoogleMovies("http://www.google.com.br/movies?near=porto+alegre&tid=1f76f971434a044")
		g.print()

module.exports = GoogleMovies