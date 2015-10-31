class CreateDiets < ActiveRecord::Migration
  def change
    create_table :diets do |t|
      t.date :dateStart
      t.date :dateEnd
      t.integer :duration
      t.string :kind
      t.references :patient, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
