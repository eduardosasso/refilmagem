config = require('./config.json')
Sequelize = require("sequelize")

sequelize = new Sequelize(
  config.development.database,
  config.development.username,
  config.development.password,
  define:
    underscored: true
    syncOnAssociation: true
  )

models =
  Cinema: sequelize.import(__dirname + "/../models/cinema")
  Adapter: sequelize.import(__dirname + "/../models/adapter")

module.exports =
  models: models
  sync: ->
    sequelize.sync()
