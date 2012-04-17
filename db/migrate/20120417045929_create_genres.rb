class CreateGenres < ActiveRecord::Migration
  def change
    create_table :genres do |t|
    	t.string :name, nul: false
      t.timestamps
    end
  end
end
