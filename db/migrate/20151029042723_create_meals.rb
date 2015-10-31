class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.string :name
      t.time :time
      t.float :totalCalories
      t.string :description
      t.references :diet, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
