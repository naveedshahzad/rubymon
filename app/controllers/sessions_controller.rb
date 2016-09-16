class SessionsController < ApplicationController
  #protect_from_forgery with: :null_session
  skip_before_action :login_required
  
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to monsters_url
  end

  def new
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_url
  end

  private
  def userparams
    params.require(:user).permit(:provider, :uid, :name, :oauthtoken, :oauthexpiresat)
  end
end
