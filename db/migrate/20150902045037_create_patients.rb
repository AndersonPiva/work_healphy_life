class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :name
      t.date :birthdate
      t.string :genre
      t.string :cpf
      t.float :weigth
      t.float :heigth
      t.float :bf
      t.string :objective
      t.string :observations
      t.string :telephone
      t.string :email
      t.string :login
      t.string :password
      t.references :clinic, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
