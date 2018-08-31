class CreateFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :foods do |t|
      t.integer :ret_code
      t.integer :food_grp_code
      t.text :ret_desc

      t.timestamps
    end
  end
end
