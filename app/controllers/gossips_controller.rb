class GossipsController < ApplicationController
  def index
    @gossips = Gossip.all
    # Méthode qui récupère tous les potins et les envoie à la view index (index.html.erb) pour affichage
  end

  def show
    @gossip = Gossip.find(params[:id])
    @user = @gossip.user
    @comments = @gossip.comments
    @comment = Comment.new
  end

  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.new(title: params[:title], content: params[:content], user_id: User.all.sample.id)

    if @gossip.save # essaie de sauvegarder en base @gossip
      redirect_to root_path, :notice => "Potin créé !"
    else
      render 'new'
    end
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    gossip_params = params.permit(:title, :content)

      if @gossip.update(gossip_params)
        # flash[:notice] = "Gossip mis à jour"
        redirect_to @gossip, :notice => "Gossip mis à jour"
      else
        render :edit
      end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to gossips_path

  end
end
