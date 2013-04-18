module.exports = {
  up: function(migration, DataTypes) {
    migration.addColumn(
      'nameOfAnExistingTable',
      'nameOfTheNewAttribute',
      DataTypes.STRING
    );
  },
  down: function(migration) {
    // add reverting commands here
  }
};