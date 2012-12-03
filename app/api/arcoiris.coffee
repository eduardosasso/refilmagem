MovieParser = require './movie_parser'
_ = require 'underscore'

class Arcoiris extends MovieParser

	parse: ($) ->
		that = this
		id_cinema = 1012

		# TODO pass the id dinamically
		# Parser should receive a hash with parameters in the constructor
		$("ul#1012 > li").each ->
			movie = $('a', this)
			movie_name = movie.text()

			# TODO needs to validate and break on current date
			showtimes_all =  $('span:first', movie.next())

			showtimes = _.compact($.map(showtimes_all.text().split('|'), (val) -> val.replace(/[^a-zA-Z0-9:\-]/g,'')))

			that.addMovie(movie_name, showtimes)

	addMovie: =>
		super

	@example_url: ->
		# Arcoiris Porto Alegre
		"http://www.arcoiriscinemas.com.br/index.php?DataObject_Controller/load/programacao_cidades/71986"

module.exports = Arcoiris