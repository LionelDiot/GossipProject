class GossipsController < ApplicationController
  before_action :authenticate_user, only: [:new, :create, :destroy, :edit, :update]
  before_action :owner?, only: [:destroy, :edit, :update]
  def create
    
    @gossip = Gossip.new(title: params[:title], content: params[:content], user: current_user)
    
    
    if @gossip.save
      flash[:success] = " Ton Gossip a bien été ajouté !"
      redirect_to home_path
      
    else
      flash[:danger] = "Erreur : ton formulaire n'etait pas correct. Le titre ne doit pas faire moins de 3 chars ou plus de 14 ! Et il doit y avoir un contenu !"
      render 'new', status: :unprocessable_entity
    end
  end
    
  def new
    
  end
  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    flash[:success] = "Le gossip a été supprimé avec succès !"
    redirect_to home_path
  end
  
  
  def edit
    @gossip = Gossip.find(params[:id])
  end
  def show
    @gossip = Gossip.find(params[:id])
    @comments = @gossip.comments.order(created_at: :desc).all
    @likers =[]
    @gossip.likes.each { |like| @likers<< like.user }

  end

  def update
    @gossip = Gossip.find(params[:id])
    if @gossip.update(gossip_params)
      flash[:success] = "Le Gossip a bien été modifié !"
      redirect_to gossip_path(@gossip)
    else
      flash[:danger] = "Erreur : ton formulaire n'était pas correct. Le titre ne doit pas faire moins de 3 chars ou plus de 14 ! Et il doit y avoir un contenu !"
      render 'edit', status: :unprocessable_entity
    end
  end

  
  private
  def owner?
    @gossip = Gossip.find(params[:id])
    unless current_user == @gossip.user
      flash[:danger] = "Impossible vous n'êtes pas le propriétaire du gossip !"
      redirect_to home_path
    end
  end
  def gossip_params
    params.require(:gossip).permit(:title, :content)
  end
  
end
