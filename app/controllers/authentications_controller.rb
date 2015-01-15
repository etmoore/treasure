class AuthenticationsController < ApplicationController

  def create
    omniauth = env['omniauth.auth']
    render json: omniauth
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
