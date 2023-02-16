class LikesController < ApplicationController
  def create
    @gossip = Gossip.find(params[:gossip_id])
    @like = Like.new(gossip: @gossip, user: current_user)
    if @like.save
      flash[:success] = " Ton Like a bien été ajouté !"
      redirect_to @gossip
    else
      flash[:danger] = "Erreur Ton like n'a pas marché !"
      redirect_to @gossip
    end
    
  end

  def destroy
    @gossip = Gossip.find(params[:gossip_id])
    @like = @gossip.likes.find_by(user_id: current_user.id)
    if @like
      @like.destroy 
      flash[:success] = "Ton Like a bien été supprimé !"
    else
      flash[:error] = "Impossible de supprimer ce like"
    end
    redirect_to @gossip

  end
end
