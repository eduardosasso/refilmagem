_ = require 'underscore'

class Movie
	clean_regex = [/\s*[-|\/]\s*(LEG|DUB)\s*[.]?$/i, /s*-* (legendado|dublado)*$/i]

	constructor: (name, showtimes = [], subtitle = null, _3d = false) ->
		@setName(name)
		@setSubtitle(subtitle || name)
		@setShowtimes(showtimes)

	setName: (name) ->
		@name = @_sanitize(name)
		@name_raw = name

	setSubtitle: (subtitle) ->
		@subtitle = @_extractSubtitle(subtitle)

	setShowtimes: (showtimes) ->
		@showtimes = showtimes

	setShowtime: (showtime) ->
		@showtimes.push(showtime)

	_extractSubtitle: (name) ->
		subtitle = 'legendado'
		_.each(clean_regex, (regex) ->
			match = regex.exec(name)
			return subtitle = 'dublado' if match and /dub/i.test(match[1])
		)
		subtitle

	_sanitize: (name) ->
		_.each(clean_regex, (expression) ->
			name = name.replace(expression, "").trim()
		)
		name

module.exports = Movie