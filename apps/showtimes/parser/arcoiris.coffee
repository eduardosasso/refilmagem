MovieParser = require './movie_parser'
moment = require 'moment'
_ = require 'underscore'

class Arcoiris extends MovieParser
	parse: ($) ->
		that = this
		id_cinema = "#1012"
		today = moment().format('DD/MM')

		# TODO pass the id dinamically
		# Parser should receive a hash with parameters in the constructor
		$("ul#{id_cinema} > li").each ->
			movie = $('a', this)
			movie_name = movie.text()

			showtimes_raw = $("h3:contains('#{today}')", movie.next())
			showtimes_today =  $('span', showtimes_raw.parent())

			return true if showtimes_today.length == 0

			showtimes = _.compact($.map(showtimes_today.text().split('|'), (val) -> val.replace(/[^a-zA-Z0-9:\-]/g,'')))

			that.addMovie(movie_name, showtimes)

	addMovie: =>
		super

	@example_url: ->
		# Arcoiris Porto Alegre
		"http://www.arcoiriscinemas.com.br/index.php?DataObject_Controller/load/programacao_cidades/71986"

module.exports = Arcoiris