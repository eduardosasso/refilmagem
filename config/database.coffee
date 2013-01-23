config = require('config')
Sequelize = require("sequelize")

sequelize = new Sequelize(
  config.database.name,
  config.database.username,
  config.database.password,
  define:
    underscored: true
  )

models =
  Cinema: sequelize.import(__dirname + "/../models/cinema")
  Adaptador: sequelize.import(__dirname + "/../models/adapter")

module.exports =
  models: models
  sync: ->
    sequelize.sync()
