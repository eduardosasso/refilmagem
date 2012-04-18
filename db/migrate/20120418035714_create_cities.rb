class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
			t.references :country, null: false
			t.string :name, null: false
      t.timestamps
    end
  end
end
