class CreateClinics < ActiveRecord::Migration
  def change
    create_table :clinics do |t|
      t.string :name
      t.string :telephone1
      t.string :telephone2
      t.string :cpfCnpj
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
