class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  before_filter :update_sanitized_params, if: :devise_controller?
  before_filter :set_locale

  def update_sanitized_params
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:name,:cover,:email,:password,:password_confirmation)}
    devise_parameter_sanitizer.for(:account_update) {|u| u.permit(:name, :cover, :current_password)}
  end

  private
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
    Rails.application.routes.default_url_options[:locale]= I18n.locale
  end
end
