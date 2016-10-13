class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  rescue_from Exception do |exception|
    redirect_to root, :notice => exception.message
  end

  before_filter :configure_permitted_parameters, if: :devise_controller?
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :password, :current_password])
  end
end
