routes = (app) ->
	cities = (req, res, next) ->
		res.locals.cities = [{id: 1, name: 'Porto Alegre'}, {id:2, name: 'São Paulo'}]
		next()
	movie_parsers = (req, res, next) ->
		res.locals.movie_parsers = [{id: 1, name: 'Google Movies'}, {id:2, name: 'Arcoiris Cinemas'}]
		next()

	app.namespace '/admin', ->
	  app.get '/cinema', (req, res) ->
	  	res.render "#{__dirname}/views/cinema/all",
	  		title: 'Cinemas'

	  app.get '/cinema/new', cities, movie_parsers, (req, res) ->
	  	res.render "#{__dirname}/views/cinema/new",
	  		title: 'Novo cinema'


module.exports = routes