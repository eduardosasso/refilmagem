Showtimes = require "../showtimes"
GoogleMovies = require "../google_movies"
_ = require 'underscore'

describe 'Google Movies', ->
	_movies = []
	before (done) =>
		new GoogleMovies(GoogleMovies.example_url(), (movies)->
			_movies = movies
			done()
		)

	it 'should have movies', =>
		_movies.length.should > 0

	it 'should have showtimes', =>
		_movies[0].showtimes.length.should > 0