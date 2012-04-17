class CreateTrailers < ActiveRecord::Migration
  def change
    create_table :trailers do |t|
    	t.references :movie, null: false
    	t.string :url, null: false
      t.timestamps
    end
  end
end
