Movie = require '../movie'

describe 'Movie', ->
	it 'should have at least a name and showtimes', ->
		movie = new Movie('Rocky')
		movie.setShowtime('10:30')
		movie.setShowtime('18:40')

		expect(movie.name).to.equal('Rocky');
		expect(movie.showtimes.length).to.equal(2);