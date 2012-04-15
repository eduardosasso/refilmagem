class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
    	t.string :original_title, null: false
			t.string :title
			t.text :description
			t.integer :duration
			t.string :age_rating
			t.integer :format
			t.integer :release_year
			t.boolean :published
      t.timestamps
    end
  end
end
