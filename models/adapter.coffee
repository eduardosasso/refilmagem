module.exports = (sequelize, DataTypes) ->
  sequelize.define 'adapter',
    name:
      type: DataTypes.STRING
      allowNull: false
      unique: true