class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :configure_permitted_parameters, if: :devise_controller?



  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :first_name, :last_name, :user, :avatar,:user_name,:phone_number ])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [ :first_name, :last_name, :user, :avatar,:user_name,:phone_number ])
  end
  private
  def store_user_location!
    # ne stocke pas si user déjà connecté
    unless user_signed_in?
      session[:user_return_to] = request.fullpath
    end
  end

  def after_sign_in_path_for(resource_or_scope)
    session.delete(:user_return_to) || super
  end
end
