class Movie
	constructor: (@name, @showtimes = []) ->
	setShowtime: (showtime) ->
		@showtimes.push(showtime)

module.exports = Movie