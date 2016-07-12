class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    keys = [
      { roles: [] },
      :username,
      :email,
      :current_password,
      :password,
      :password_confirmation,
      :avatar
    ]

    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(keys)
    end
    devise_parameter_sanitizer.permit(:account_update) do |user_params|
      user_params.permit(keys)
    end
  end

  def check_ownership_of_item()

  end
end
