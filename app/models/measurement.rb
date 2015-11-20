class Measurement < ActiveRecord::Base
  belongs_to :patient
  belongs_to :recent_activity

  validates_presence_of :date, :nameMeasure, :size, :patient_id
end
