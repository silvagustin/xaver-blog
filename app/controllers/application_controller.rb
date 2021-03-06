class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # CanCanCan
  alias_method :current_user, :current_usuario

  rescue_from CanCan::AccessDenied do |exception|
  	redirect_to root_url, :alert => exception.message
  end
end
