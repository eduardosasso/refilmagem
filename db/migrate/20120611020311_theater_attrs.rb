class TheaterAttrs < ActiveRecord::Migration
  def up
  	change_table :theaters do |t|
    	t.references :city
    	t.references :state
    	t.references :adapter
    	t.string :scraper_url, null: false
  	end
  	change_column :theaters, :lat, :decimal, {:precision => 10, :scale => 7}
  	change_column :theaters, :long, :decimal, {:precision => 10, :scale => 7}  	
  end

  def down
  	change_table :theaters do |t|
  		t.remove :city_id
  		t.remove :state_id
  		t.remove :adapter_id
  		t.remove :scraper_url
  	end
  end
end
