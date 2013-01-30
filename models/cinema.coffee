module.exports = (sequelize, DataTypes) ->
  sequelize.define "cinema",
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