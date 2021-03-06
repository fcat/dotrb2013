class SessionsController < ApplicationController
  def create
    user = UserBuilder.new.from_omniauth(env['omniauth.auth'])
    session[:user_id] = user.id
    redirect_to root_url, notice: "Signed in."
  end

  def fail
    redirect_to root_url, alert: "Sign in failed!"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Signed out."
  end
end
