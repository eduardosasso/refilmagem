Movie = require '../movie'

describe 'Movie', ->
	it 'should have at least a name and showtimes', ->
		movie = new Movie('Rocky')
		movie.setShowtime('10:30')
		movie.setShowtime('18:40')

		expect(movie.name).to.equal('Rocky')
		expect(movie.showtimes.length).to.equal(2)

	it 'should have name sanitized', ->
		expect(new Movie('Rocky legendado').name).to.equal('Rocky')
		expect(new Movie('Rocky - legendado').name).to.equal('Rocky')
		expect(new Movie('Rocky -Legendado').name).to.equal('Rocky')
		expect(new Movie('Rocky -dublado').name).to.equal('Rocky')
		expect(new Movie('Rocky - dublado').name).to.equal('Rocky')
		expect(new Movie('Rocky dublado ').name).to.equal('Rocky')
		expect(new Movie('Rocky DUB.').name).to.equal('Rocky')
		expect(new Movie('Rocky - DUB.').name).to.equal('Rocky')
		expect(new Movie('Rocky -LEG').name).to.equal('Rocky')
		expect(new Movie('Rocky - LEG').name).to.equal('Rocky')
		expect(new Movie('Rocky / DUB.').name).to.equal('Rocky')
		expect(new Movie('Rocky / DUB').name).to.equal('Rocky')
		expect(new Movie('Rocky /DUB').name).to.equal('Rocky')

	it 'should extract the subtitle', ->
		expect(new Movie('Rocky legendado').subtitle).to.equal('legendado')
		expect(new Movie('Rocky - legendado').subtitle).to.equal('legendado')
		expect(new Movie('Rocky -Legendado').subtitle).to.equal('legendado')
		expect(new Movie('Rocky -dublado').subtitle).to.equal('dublado')
		expect(new Movie('Rocky - dublado').subtitle).to.equal('dublado')
		expect(new Movie('Rocky dublado ').subtitle).to.equal('dublado')
		expect(new Movie('Rocky DUB.').subtitle).to.equal('dublado')
		expect(new Movie('Rocky - DUB.').subtitle).to.equal('dublado')
		expect(new Movie('Rocky / DUB.').subtitle).to.equal('dublado')
		expect(new Movie('Rocky / DUB').subtitle).to.equal('dublado')
		expect(new Movie('Rocky /DUB').subtitle).to.equal('dublado')
		expect(new Movie('Rocky -LEG').subtitle).to.equal('legendado')
		expect(new Movie('Rocky - LEG').subtitle).to.equal('legendado')