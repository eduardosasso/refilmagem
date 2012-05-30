Showtimes = require "../showtimes"

describe "Showtimes", ->
	it "should run the parser", (done) ->
		# if done fails to get called it will thrown an error
		parser = new class
  			run: ($) -> done()

		new Showtimes("http://www.google.com.br/movies?near=porto+alegre&tid=8ae8a7a6a67628ba", parser)