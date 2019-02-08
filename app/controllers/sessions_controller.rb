class SessionsController < ApplicationController

  def new #new qui correspond à la page de login
  end

  def create
    user = User.find_by(email: params[:email])

    # on vérifie si l'utilisateur existe bien
    # ET si on arrive à l'authentifier (méthode bcrypt)
    # avec le mot de passe
    if user && user.authenticate(params[:password])
      log_in(user)
      flash[:notice] = "Vous êtes connecté"
      redirect_to root_path
      # redirige où tu veux, avec un flash ou pas
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end

end
