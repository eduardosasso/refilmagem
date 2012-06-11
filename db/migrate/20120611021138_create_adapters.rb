class CreateAdapters < ActiveRecord::Migration
  def change
    create_table :adapters do |t|
    	t.string :name, null: false
      t.timestamps
    end
  end
end
