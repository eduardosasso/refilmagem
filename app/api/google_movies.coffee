Showtimes = require "./showtimes"

class GoogleMovies
	run: ($) ->
		$(".showtimes .movie").each ->
			movie = $('.name', this).text()
			showtimes = $.map($('.times', this).text().split('&nbsp'), (val) -> val.replace(/[^a-zA-Z0-9:\-]/g,''))
			console.log movie
			console.log " -", showtimes

module.exports = GoogleMovies

new Showtimes("http://www.google.com.br/movies?near=porto+alegre&tid=8ae8a7a6a67628ba", new GoogleMovies)