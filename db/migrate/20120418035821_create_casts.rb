class CreateCasts < ActiveRecord::Migration
  def change
    create_table :casts do |t|
    	t.references :movie
    	t.string :name, null: false
    	t.text :description
      t.timestamps
    end
  end
end
