MovieShowtimes = require '../../../apps/showtimes/movie_showtimes'

describe 'MovieShowtimes', ->
	it 'should have at least a name and showtimes', ->
		movie = new MovieShowtimes('Rocky')
		movie.setShowtime('10:30')
		movie.setShowtime('18:40')

		expect(movie.name).to.equal('Rocky')
		expect(movie.showtimes.length).to.equal(2)

	it 'should have name sanitized', ->
		expect(new MovieShowtimes('Rocky legendado').name).to.equal('Rocky')
		expect(new MovieShowtimes('Rocky - legendado').name).to.equal('Rocky')
		expect(new MovieShowtimes('Rocky -Legendado').name).to.equal('Rocky')
		expect(new MovieShowtimes('Rocky -dublado').name).to.equal('Rocky')
		expect(new MovieShowtimes('Rocky - dublado').name).to.equal('Rocky')
		expect(new MovieShowtimes('Rocky dublado ').name).to.equal('Rocky')
		expect(new MovieShowtimes('Rocky DUB.').name).to.equal('Rocky')
		expect(new MovieShowtimes('Rocky - DUB.').name).to.equal('Rocky')
		expect(new MovieShowtimes('Rocky -LEG').name).to.equal('Rocky')
		expect(new MovieShowtimes('Rocky - LEG').name).to.equal('Rocky')
		expect(new MovieShowtimes('Rocky / DUB.').name).to.equal('Rocky')
		expect(new MovieShowtimes('Rocky / DUB').name).to.equal('Rocky')
		expect(new MovieShowtimes('Rocky /DUB').name).to.equal('Rocky')

	it 'should extract the subtitle', ->
		expect(new MovieShowtimes('Rocky legendado').subtitle).to.equal('legendado')
		expect(new MovieShowtimes('Rocky - legendado').subtitle).to.equal('legendado')
		expect(new MovieShowtimes('Rocky -Legendado').subtitle).to.equal('legendado')
		expect(new MovieShowtimes('Rocky -dublado').subtitle).to.equal('dublado')
		expect(new MovieShowtimes('Rocky - dublado').subtitle).to.equal('dublado')
		expect(new MovieShowtimes('Rocky dublado ').subtitle).to.equal('dublado')
		expect(new MovieShowtimes('Rocky DUB.').subtitle).to.equal('dublado')
		expect(new MovieShowtimes('Rocky - DUB.').subtitle).to.equal('dublado')
		expect(new MovieShowtimes('Rocky / DUB.').subtitle).to.equal('dublado')
		expect(new MovieShowtimes('Rocky / DUB').subtitle).to.equal('dublado')
		expect(new MovieShowtimes('Rocky /DUB').subtitle).to.equal('dublado')
		expect(new MovieShowtimes('Rocky -LEG').subtitle).to.equal('legendado')
		expect(new MovieShowtimes('Rocky - LEG').subtitle).to.equal('legendado')