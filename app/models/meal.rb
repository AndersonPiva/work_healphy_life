class Meal < ActiveRecord::Base
  belongs_to :diet
  has_many :foods, autosave: true
  accepts_nested_attributes_for :foods, :reject_if => :all_blank, :allow_destroy => true
end
