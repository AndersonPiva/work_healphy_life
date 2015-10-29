class CreateDiets < ActiveRecord::Migration
  def change
    create_table :diets do |t|
      t.date :dateStart
      t.date :dateEnd
      t.integer :duration
      t.float :totalCalories
      t.string :status
      t.string :type
      t.references :patient, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
