Arcoiris = require "../../../apps/showtimes/parser/arcoiris"

describe 'Arcoiris', ->
	_movies = []
	before (done) =>
		new Arcoiris(Arcoiris.example_url(), (error, movies)->
			_movies = movies
			done()
		)

	it 'should have movies', =>
		_movies.length.should > 0

	it 'should have showtimes', =>
		_movies[0].showtimes.length.should > 0