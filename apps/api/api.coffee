util = require('util')
models = require('../../models/models')

module.exports = ->
  index: (req, res) ->
    models.Cinema.all()
      .success (items)-> res.json(items)