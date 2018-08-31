class CreateNutrients < ActiveRecord::Migration[5.2]
  def change
    create_table :nutrients do |t|
      t.string :name
      t.integer :level
      t.references :food, foreign_key: true

      t.timestamps
    end
  end
end
