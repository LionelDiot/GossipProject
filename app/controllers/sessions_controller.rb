class SessionsController < ApplicationController
  before_action: authenticate_user, only: [:destroy]
  before_action: authenticate_guest, only: [:new, :create]
  def create
    # cherche s'il existe un utilisateur en base avec l’e-mail
    
    user = User.find_by(email: params[:email])
    
    
    # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe 
    if user && user.authenticate(params[:password])
      log_in(user)
      remember(user)
      # redirige où tu veux, avec un flash ou pas
      flash.now[:success] = 'Connection réussi !'
      redirect_to home_path
      
    else
      flash.now[:danger] = 'Ton mot de passe ou ton email est incorrect'
      render 'new', status: :unprocessable_entity
      
    end
  end
  
  def destroy
    user = current_user
    log_out(user)
    if current_user == nil 
      flash.now[:success] = 'Déconnection réussi !'
      redirect_to home_path
    else 
      flash.now[:danger] = "La déconnection n'a pas marché comme prévu"
      render 'new', status: :unprocessable_entity
    end
  end
  
  
end