class ApplicationController < ActionController::Base
  protect_from_forgery
    
  def index
    
  end

  def subdomain 
    @subdomain ||= request.subdomain
  end
  helper_method :subdomain

  private

  def current_game_instance
    @current_game_instance ||= GameInstance.find_by_auth_token(cookies[:game_instance_auth_token]) if cookies[:game_instance_auth_token]
  end
  
end
