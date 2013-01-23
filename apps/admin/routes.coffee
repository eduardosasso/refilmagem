util = require('util')

routes = (app) ->
	cities = (req, res, next) ->
		res.locals.cities = [{id: 1, name: 'Porto Alegre'}, {id:2, name: 'São Paulo'}]
		next()
	movie_parsers = (req, res, next) ->
		res.locals.movie_parsers = [{id: 1, name: 'Google Movies'}, {id:2, name: 'Arcoiris Cinemas'}]
		next()

	app.namespace '/admin', ->
		app.namespace '/cinema', ->
		  app.get '/', (req, res) ->
		  	res.render "#{__dirname}/views/cinema/all",
		  		title: 'Cinemas'

		  app.get '/new', cities, movie_parsers, (req, res) ->
		  	res.render "#{__dirname}/views/cinema/new",
		  		title: 'Novo cinema',
		  		cinema: req.body


		  app.post '/', cities, movie_parsers, (req, res) ->
		  	req.assert('nome', 'Nome é obrigatório').isAlpha()
		  	req.assert('endereco', 'Endereço é obrigatório').isAlpha()
		  	req.assert('adaptador', 'Adaptador é obrigatório').isInt()
		  	req.assert('cidade', 'Cidade é obrigatório').isInt()
		  	errors = req.validationErrors()
  			if errors
  				if errors.length == 4
  					req.flash 'error', "Todos os campos são obrigatórios."
  				else
	  				for error in errors
	  					req.flash 'error', error.msg
	  			res.render "#{__dirname}/views/cinema/new",
	  				title: 'Novo Cinema',
	  				cinema: req.body
	  			return
  			else
  				req.flash 'info', "Cinema registrado!"
					res.redirect '/admin/cinema/'

module.exports = routes