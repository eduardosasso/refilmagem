jsdom = require("jsdom")

class Showtimes
	constructor: (@url, @parser) ->
		jsdom.env
		  html: @url
		  scripts: [ "http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js" ]
		  done: (errors, window) =>
		    $ = window.$
		    @parser.run $

module.exports = Showtimes		    