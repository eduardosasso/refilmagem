class CityAttrs < ActiveRecord::Migration
  def up
  	change_table :cities do |t|
  		t.references :state
  	end
  end

  def down
  	change_table :cities do |t|
  		t.remove :state_id
  	end
  end
end
