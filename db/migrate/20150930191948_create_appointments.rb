class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.date :dateAppointment
      t.time :schedule
      t.float :price
      t.string :description
      t.references :user, index: true, foreign_key: true
      t.references :clinic, index: true, foreign_key: true
      t.references :patient, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
