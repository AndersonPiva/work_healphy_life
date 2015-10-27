class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :name
      t.string :description
      t.integer :series
      t.string :repeats
      t.time :duration
      t.references :training, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
