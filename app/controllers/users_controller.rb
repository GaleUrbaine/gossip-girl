class UsersController < ApplicationController
  # def user_params
  #   params.permit(:first_name, :last_name, :description, :email, :age, :password, :confpassword)
  # end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    puts "*" * 60
    puts params
    puts "*" * 60
    @user = User.new(first_name: params[:first_name],
                     last_name: params[:last_name],
                     description: params[:description],
                     email: params[:email],
                     age: params[:age],
                     password: params[:password],
                     city_id: City.all.sample.id)

    if @user.save # essaie de sauvegarder en base @gossip
      session[:user_id] = @user.id
      redirect_to root_path, :notice => "Bienvenue #{@user.first_name} !"
    else
      render 'new'
    end
    # Par rapport à ce qu'on a vu jusque-là, la méthode #create du controller users ne change quasiment pas. Simplement, il faut récupérer le mot de passe depuis le formulaire d'inscription (via params) et faire un simple User.new(email: "xxx", password: "yyy"). La gem bcrypt s'occupe de tout côté model pour encrypter le password : Fat model, skinny controller !
    # User.new(email: "xxx", password: "yyy")
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
