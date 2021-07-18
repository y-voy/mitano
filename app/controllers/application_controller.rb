class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :image, :image_cache, :introduction])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name, :image, :image_cache, :introduction])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :image, :image_cache, :introduction])
  end

end
