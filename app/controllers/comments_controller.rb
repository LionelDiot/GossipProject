class CommentsController < ApplicationController
  def create
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.new(gossip: @gossip, content: params[:content])
    if @comment.save
      flash[:success] = " Ton Commentaire a bien été ajouté !"
      redirect_to @gossip
    else
      flash[:danger] = "Erreur : ton formulaire n'etait pas correct. Le titre ne doit pas faire moins de 3 chars ou plus de 14 ! Et il doit y avoir un contenu !"
      render 'new'
    end
    
  end
  

  def edit
    @gossip = Gossip.find(params[:gossip_id])
    @comment = @gossip.comments.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @gossip = @comment.gossip
    if @comment.update(content: params[:comment][:content])
      redirect_to @comment.gossip, notice: "Le commentaire a été modifié avec succès!"
    else
      render :edit, status: :unprocessable_entity
    end
  end
  

  def destroy
    @gossip = Gossip.find(params[:gossip_id])
    @comment = @gossip.comments.find(params[:id])
    @comment.destroy
    redirect_to gossip_path(@gossip)
  end

end
