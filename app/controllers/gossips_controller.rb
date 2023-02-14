class GossipsController < ApplicationController
  def create
    @gossip = Gossip.new(title: params[:title], content: params[:content], user: User.find(id=1))
    puts @gossip.inspect
    
    if @gossip.save
      flash[:success] = " Ton Gossip a bien été ajouté !"
      redirect_to home_path
      flash[:success] = " Ton Gossip a bien été ajouté !"
    else
      flash[:danger] = "Erreur : ton formulaire n'etait pas correct. Le titre ne doit pas faire moins de 3 chars ou plus de 14 ! Et il doit y avoir un contenu !"
      render 'new'
    end
  end
    
  def new
    
  end
end
