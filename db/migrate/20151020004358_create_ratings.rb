class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.date :date
      t.float :muscleWeight
      t.float :residualWeigth
      t.float :boneWeight
      t.float :bodyFat
      t.float :excessWeigth
      t.float :imc
      t.references :patient, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
