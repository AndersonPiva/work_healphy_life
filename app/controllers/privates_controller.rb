class PrivatesController < ApplicationController
  protect_from_forgery with: :exception
  before_action :authenticate_user!


  def dashboard
    @appointens_today = []
    current_user.appointments.each do |appointment|
      if appointment.dateAppointment == Date.today
        @appointens_today << appointment
      end
    end

    @compromises_today = []
    current_user.compromises.each do |compromise|
      if compromise.date == Date.today
        @compromises_today << compromise 
      end
    end
  end
end
