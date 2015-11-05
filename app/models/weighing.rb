class Weighing < ActiveRecord::Base
  validates_presence_of :dateWeighing, :weight, :patient_id
  belongs_to :patient
end
