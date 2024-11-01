class ApplicationController < ActionController::Base
  include SessionsHelper

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
 
  
  
  private

  # verifie si utilisateur connecter
  def authenticate_user
    unless current_user
      flash[:danger] = "Veuillez vous connecter."
      redirect_to new_session_path
    end
  end
end