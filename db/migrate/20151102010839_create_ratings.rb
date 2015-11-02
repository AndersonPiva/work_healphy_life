class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.references :patient, index: true, foreign_key: true
      t.date :date
      t.float :handleDiameter
      t.float :kneeDiameter
      t.float :leg
      t.float :belly
      t.float :chest

      t.timestamps null: false
    end
  end
end
