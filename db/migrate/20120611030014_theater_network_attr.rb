class TheaterNetworkAttr < ActiveRecord::Migration
  def up
  	change_table :theaters do |t|
  		t.references :theater_networks
  	end
  end

  def down
  end
end
