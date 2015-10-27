class Appointment < ActiveRecord::Base
  belongs_to :user
  belongs_to :clinic
  belongs_to :patient
end
