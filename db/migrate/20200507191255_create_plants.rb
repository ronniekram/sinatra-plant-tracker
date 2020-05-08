class CreatePlants < ActiveRecord::Migration
  def change
    create_table :plants do |t|
      t.string :name
      t.string :light
      t.string :water
      t.string :last_date
      t.integer :user_id
    end 
  end
end
