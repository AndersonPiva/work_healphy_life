class PrivatesController < ApplicationController
  protect_from_forgery with: :exception
  before_action :verify_user

  private
    	def verify_user
      	if !current_user.present? && !current_patient.present?
        		redirect_to new_user_session_path , :notice => I18n.t('sign_in_to_continue')
      	end
      end
end
