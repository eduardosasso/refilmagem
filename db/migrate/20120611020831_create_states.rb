class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
    	t.references :country, null: false
    	t.string :name, null: false
      t.timestamps
    end
  end
end