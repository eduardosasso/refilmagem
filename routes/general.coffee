routes = (app) ->
  app.all '*', (req, res, next) ->
    app.locals
      flash: req.flash()
    next()

module.exports = routes
