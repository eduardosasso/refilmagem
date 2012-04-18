class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
    	t.references :movie, null: false
    	t.string :url, null: false
    	t.integer :type, null: false
      t.timestamps
    end
  end
end
