class UsersController < ApplicationController
  before_action :authenticate_user, only: [:edit, :update, :destroy]
  def show
    @user = User.find(params[:id])
    
  end
  def edit
    @user = current_user
    @cities = City.all
  end
  def update
    user_params["city_id"] = user_params["city_id"].to_i
    @user = current_user
    if params[:password] == params[:password_confirmation]
      if @user.update(user_params)
        flash[:success] = "Ton profil a bien été modifié !"
        redirect_to user_path(@user)
      else
        flash[:danger] = "Erreur à la sauvegarde du profil"
        logger.error @user.errors.inspect
        render 'edit', status: :unprocessable_entity
      end
    else 
        flash[:danger] = "Erreur : ton mot de passe et la confirmation n'était pas identique, essaie encore !"
        render 'edit', status: :unprocessable_entity
    end
  end
  def new
    @user = User.new
    @cities = City.all
  end
  def create
    user_params["city_id"] = user_params["city_id"].to_i
    user = User.new(user_params)
    
    

    if user.save
      log_in user
      remember(user)
      flash[:success] = " Ton profil a bien été créé !"
      redirect_to home_path
      
    else
      flash[:danger] = "Erreur : ton formulaire n'etait pas correct. Essaie encore"
      logger.error user.errors.inspect
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy

  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :age, :city_id, :description, :password, :password_confirmation)
  end
  
  
end