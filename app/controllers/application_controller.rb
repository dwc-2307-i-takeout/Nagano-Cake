class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def after_sign_in_path_for(resource)
    if resource.is_a?(Customer)
      root_path
    elsif resource.is_a?(Admin)
      admin_admin_path
    end
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource)
    if  resource.is_a?(Customer)
      root_path
    elsif resource.is_a?(Admin)
      new_admin_session_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end
