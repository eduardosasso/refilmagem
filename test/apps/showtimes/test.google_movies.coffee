GoogleMovies = require "../../../apps/showtimes/parser/google_movies"

describe 'Google Movies', ->
	_movies = []
	before (done) =>
		new GoogleMovies(GoogleMovies.example_url(), (error, movies)->
			_movies = movies
			done()
		)

	it 'should have movies', =>
		_movies.should.not.have.length(0)

	it 'should have showtimes', =>
		_movies[0].showtimes.length.should.be.above(0)