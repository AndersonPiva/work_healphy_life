class Diet < ActiveRecord::Base
  belongs_to :patient
  has_many :meals, :dependent => :delete_all
  accepts_nested_attributes_for :meals, :reject_if => :all_blank, :allow_destroy => true
end
