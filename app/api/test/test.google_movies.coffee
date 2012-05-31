Showtimes = require "../showtimes"
GoogleMovies = require "../google_movies"

describe 'Google Movies', ->
	it 'should return movies and showtimes', (done) ->
		google_movies = new class extends GoogleMovies
			run: ($) -> 
				movies = super $
				expect(movies.length > 0).to.be.true
				expect(movies[0].showtimes.length > 0).to.be.true
				
				# should match movie hour like 20:30, 22:10, 3:15...
				movies[0].showtimes[0].should.match(/^([01]?\d|2[0-3]):([0-5]\d)$/)

				done()

		new Showtimes("http://www.google.com.br/movies?near=porto+alegre&tid=8ae8a7a6a67628ba", google_movies)