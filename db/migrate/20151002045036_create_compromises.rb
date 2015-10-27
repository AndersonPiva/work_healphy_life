class CreateCompromises < ActiveRecord::Migration
  def change
    create_table :compromises do |t|
      t.string :title
      t.date :date
      t.time :schedule
      t.string :description
      t.references :user, index: true, foreign_key: true
      
      t.timestamps null: false
    end
  end
end
