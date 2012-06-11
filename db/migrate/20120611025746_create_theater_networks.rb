class CreateTheaterNetworks < ActiveRecord::Migration
  def change
    create_table :theater_networks do |t|
    	t.string :name, null: false
      t.timestamps
    end
  end
end
