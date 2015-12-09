class CreateReminders < ActiveRecord::Migration
  def change
    create_table :reminders do |t|
      t.string :description
      t.references :patient, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
