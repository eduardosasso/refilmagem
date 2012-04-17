class MovieGenre < ActiveRecord::Migration
	def up
		change_table :movies do |t|
			t.references :genre
		end
	end

	def down
		remove_column :movies, :genre
	end
end
