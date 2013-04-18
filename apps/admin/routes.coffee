util = require('util')
models = require('../../models/models')

new_movie = (req,res) ->
  res.locals.cities = [{id: 1, name: 'Porto Alegre'}, {id:2, name: 'São Paulo'}]
  res.locals.movie_parsers = [{id: 1, name: 'Google Movies'}, {id:2, name: 'Arcoiris Cinemas'}]
  res.locals.cinema = req.body
  res.render "#{__dirname}/views/cinema/new",
    title: 'Novo cinema'

routes = (app) ->
  app.namespace '/admin', ->
    app.namespace '/cinema', ->
      app.get '/', (req, res) ->
        res.render "#{__dirname}/views/cinema/all",
          title: 'Cinemas'

      app.get '/new', new_movie
      app.post '/new', (req, res, next) ->
        cinema = models.Cinema.build({name: req.body.name, scraper_url: req.body.scraper_url})
        cinema.save()
          .success ()->
            req.flash 'info', "Cinema registrado!"
            res.redirect './'
          .error (error)->
            res.locals.error = "Erro #{error.message}"
            new_movie(req,res)

module.exports = routes
