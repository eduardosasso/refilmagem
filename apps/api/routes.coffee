Api = require('./api')
api = new Api()

module.exports = (app) ->
  app.namespace '/api', ->
    app.namespace '/cinemas', ->
      app.get '/', (req, res) -> api.index(req,res)
