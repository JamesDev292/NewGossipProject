class SessionsController < ApplicationController


  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      log_in(user)# Utilise la méthode du helper pour connecter l'utilisateur
      redirect_to gossips_path
    else
      flash.now[:danger] = "Invalid email/password combination"
      render "new"
    end
    
  end


  def destroy
    session.delete(:user_id) # Supprime l'ID de l'utilisateur de la session
    redirect_to new_session_path, notice: "Vous êtes déconnecté."
  end


end
