class Reminder < ActiveRecord::Base
  belongs_to :patient
  has_one :appointment, :dependent => :destroy


  def getDate
    self.appointment.dateAppointment.strftime("%d/%m/%y")
  end
end
