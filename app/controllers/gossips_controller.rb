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
    puts "*" * 60
    puts @comments
    puts "*" * 60
  end

  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.new(title: params[:title], content: params[:content], user_id: 100)

    if @gossip.save # essaie de sauvegarder en base @gossip
      redirect_to root_path, :notice => "User saved"
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
        redirect_to @gossip
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
