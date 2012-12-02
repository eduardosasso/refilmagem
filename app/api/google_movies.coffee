MovieParser = require './movie_parser'

class GoogleMovies extends MovieParser
	@SUBTITLE_REGEX = /s*-* (legendado|dublado)*$/i

	parse: ($) ->
		that = this
		$(".showtimes .movie").each ->
			name = $('.name', this).text()
			showtimes = $.map($('.times', this).text().split('&nbsp'), (val) -> val.replace(/[^a-zA-Z0-9:\-]/g,''))
			subtitle = that.subtitle(name)
			name = that.normalize(name)
			that.addMovie(name, showtimes, subtitle)

	subtitle: (movie_name) ->
		match = GoogleMovies.SUBTITLE_REGEX.exec(movie_name)
		match[1].toLowerCase() if match

	normalize: (movie_name) ->
		movie_name.replace(GoogleMovies.SUBTITLE_REGEX, "").trim()

	addMovie: =>
		super

	@example_url: ->
		"http://www.google.com.br/movies?near=porto+alegre&tid=1f76f971434a044"

module.exports = GoogleMovies