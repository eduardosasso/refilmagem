class CityState < ActiveRecord::Migration
  def change
    add_column :cities, :state, :string, limit: 2, null: false
  end
end
