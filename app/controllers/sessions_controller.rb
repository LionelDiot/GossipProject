class SessionsController < ApplicationController
  def create
    # cherche s'il existe un utilisateur en base avec l’e-mail
    
    user = User.find_by(email: params[:email])
    puts user
    # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe 
    if user && user.authenticate(params[:password])
      log_in user
      # redirige où tu veux, avec un flash ou pas
      flash.now[:success] = 'Connection réussi !'
      redirect_to home_path
    else
      flash.now[:danger] = 'Ton mot de passe ou ton email est incorrect'
      render 'new'
    end
  end
  
  def destroy
    session.delete(:user_id)
    if current_user == nil 
      flash.now[:success] = 'Déconnection réussi !'
      redirect_to home_path
    else 
      flash.now[:danger] = "La déconnection n'a pas marché comme prévu"
      render 'new'
    end
  end
  
  
end