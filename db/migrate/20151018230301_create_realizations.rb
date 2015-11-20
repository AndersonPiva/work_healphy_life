class CreateRealizations < ActiveRecord::Migration
  def change
    create_table :realizations do |t|
      t.date :date
      t.string :status
      t.string :observation
      t.references :training, index: true, foreign_key: true
      t.references :patient, index: true, foreign_key: true
      t.references :recent_activity

      t.timestamps null: false
    end
  end
end
