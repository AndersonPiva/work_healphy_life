class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :update_sanitized_params, if: :devise_controller?
  before_filter :set_locale

  def update_sanitized_params
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:name,:telephone1, :telephone2, :cpf, :cover,:email,:password,:password_confirmation, :user_id, :birthdate, :genre, :weigth, :heigth, :bf, :objective, :observations, :telephone, :clinic_id)}
    devise_parameter_sanitizer.for(:account_update) {|u| u.permit(:name,:telephone1, :telephone2, :cpf,  :cover, :current_password, :password, :password_confirmation, :user_id, :birthdate, :genre, :weigth, :heigth, :bf, :objective, :observations, :telephone, :clinic_id)}
  end

  private
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
    Rails.application.routes.default_url_options[:locale]= I18n.locale
  end

end
