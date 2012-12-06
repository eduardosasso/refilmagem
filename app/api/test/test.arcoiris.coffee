Showtimes = require "../showtimes"
Arcoiris = require "../arcoiris"
_ = require 'underscore'

describe 'Arcoiris', ->
	_movies = []
	before (done) =>
		new Arcoiris(Arcoiris.example_url(), (movies)->
			_movies = movies
			done()
		)

	it 'should have movies', =>
		_movies.length.should > 0

	it 'should have showtimes', =>
		_movies[0].showtimes.length.should > 0