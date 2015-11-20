class CreateMeasurements < ActiveRecord::Migration
  def change
    create_table :measurements do |t|
      t.date :date
      t.string :nameMeasure
      t.float :size
      t.references :patient, index: true, foreign_key: true
      t.references :recent_activity

      t.timestamps null: false
    end
  end
end
