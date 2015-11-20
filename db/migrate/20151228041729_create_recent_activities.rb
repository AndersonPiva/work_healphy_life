class CreateRecentActivities < ActiveRecord::Migration
  def change
    create_table :recent_activities do |t|
      t.date :date
      t.references :patient, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.string :description
      t.time :shedule

      t.timestamps null: false
    end
  end
end
