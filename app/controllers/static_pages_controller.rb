class StaticPagesController < ApplicationController
  def home
    @gossips = Gossip.all
    @gossips = Gossip.order(updated_at: :desc).all
  end
  def contact
  end
  def team
  end
  
end
