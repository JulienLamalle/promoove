class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_theme
  around_action :set_locale_from_url

  def set_theme
    if params[:theme].present?
      theme = params[:theme].to_sym
      cookies[:theme] = { value: theme, expires: 3.year }
      redirect_to(request.referrer || root_path)
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, :terms])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :password_confirmation, :first_name, :last_name, :github_link, :gitlab_link, :twitter_link, :linkedin_link, :professional_background, :description, :date_of_birth])
  end
end
