class CreateTheaters < ActiveRecord::Migration
  def change
    create_table :theaters do |t|
    	t.string :name, null: false
    	t.string :address
    	t.string :site
    	t.decimal :lat
    	t.decimal :long
      t.timestamps
    end
  end
end
