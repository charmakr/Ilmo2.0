class SessionsController < ApplicationController
  skip_before_filter :authentication_required
  def index    
end

  def create
    session[:user]=true
    redirect_to "/"
  end
end
