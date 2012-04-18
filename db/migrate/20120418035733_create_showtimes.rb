class CreateShowtimes < ActiveRecord::Migration
  def change
    create_table :showtimes do |t|
    	t.references :movie, null: false
    	t.references :theater, null: false
    	t.string :hour, null: false
      t.timestamps
    end
  end
end
