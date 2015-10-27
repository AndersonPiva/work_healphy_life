class CreateWeighings < ActiveRecord::Migration
  def change
    create_table :weighings do |t|
      t.date :dateWeighing
      t.float :weight
      t.references :patient, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
