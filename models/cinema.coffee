module.exports = (sequelize, DataTypes) ->
  adapter = sequelize.import(__dirname + "/../models/adapter")

  cinema = sequelize.define "cinema",
    name:
      type: DataTypes.STRING
      allowNull: false
    address: DataTypes.TEXT
    site: DataTypes.STRING
    lat: DataTypes.FLOAT
    long: DataTypes.FLOAT
    scraper_url:
      type: DataTypes.STRING
      allowNull: false

  cinema.belongsTo(adapter)