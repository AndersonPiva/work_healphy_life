class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :city
      t.string :state
      t.string :district
      t.string :street
      t.string :cep
      t.integer :number
      t.string :reference

      t.timestamps null: false
    end
  end
end
