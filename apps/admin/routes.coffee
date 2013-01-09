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
		  		title: 'Novo cinema'

		  app.post '/', (req, res) ->
		  	# console.log req.body
		  	req.flash 'error', "information message"
		  	# res.redirect '/admin/cinema'
		  	res.redirect '/admin/cinema/new'

		  # Create a Cinema.
      # app.post '/', (req, res) ->
      # 	console.log req.body
      #   # attributes =
        #   name: req.body.name
        #   type: req.body.type
        # pie = new Pie attributes
        # pie.save () ->
        #   req.flash 'info', "Pie '#{pie.name}' was saved."
        #   res.redirect '/admin/pies'


module.exports = routes