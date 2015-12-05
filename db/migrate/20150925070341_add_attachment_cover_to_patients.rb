class AddAttachmentCoverToPatients < ActiveRecord::Migration
  def self.up
    change_table :patients do |t|
      t.attachment :cover
    end
  end

  def self.down
    remove_attachment :products, :patients
  end
end
