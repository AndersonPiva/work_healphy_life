class CreateTrainings < ActiveRecord::Migration
  def change
    create_table :trainings do |t|
      t.string :weekDay
      t.string :muscularGroups
      t.string :description
      t.date :dateStart
      t.date :dateEnd
      t.time :duration
      t.references :patient, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
