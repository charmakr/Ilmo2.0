class SessionsController < ApplicationController
  skip_before_filter :authentication_required
  def index    
end

  def create
    user = User.authenticate(params[:user][:username], params[:user][:password])
    session[:user]=user.id
    redirect_to "/"
  end
  def destroy
    reset_session
    redirect_to "/"
  end
end
