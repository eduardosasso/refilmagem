class Movie
	constructor: (@name, @showtimes = [], @subtitle = 'legendado', @_3d = false) ->

	setShowtime: (showtime) ->
		@showtimes.push(showtime)

module.exports = Movie