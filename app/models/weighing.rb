class Weighing < ActiveRecord::Base
  validates_presence_of :dateWeighing, :weight, :patient_id
  belongs_to :patient
  belongs_to :recent_activity
end
