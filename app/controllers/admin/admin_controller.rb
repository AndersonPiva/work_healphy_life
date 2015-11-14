class Admin::AdminController < ApplicationController
	before_action :verify_user
	protect_from_forgery with: :exception

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


private
  	def verify_user
    	if !current_user.present?
      		redirect_to root_path , :notice => 'Área Restrita.'
    	end
	  end
end
