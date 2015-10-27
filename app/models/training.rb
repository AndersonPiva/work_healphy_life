class Training < ActiveRecord::Base
  belongs_to :patient
  has_many :exercises, :dependent => :delete_all
  has_many :realizations, :dependent => :delete_all
  accepts_nested_attributes_for :exercises, :reject_if => :all_blank, :allow_destroy => true
end
