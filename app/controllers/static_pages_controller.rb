class StaticPagesController < ApplicationController
  def team
  end
  def contact
  end
  def index
    @gossip = Gossip.all
  end
end
