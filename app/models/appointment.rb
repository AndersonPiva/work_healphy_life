class Appointment < ActiveRecord::Base
  belongs_to :user
  belongs_to :clinic
  belongs_to :patient
  validates_presence_of :dateAppointment, :schedule, :patient_id, :clinic_id
end
