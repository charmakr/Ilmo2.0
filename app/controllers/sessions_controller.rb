class SessionsController < ApplicationController
  skip_before_filter :authentication_required
  def index    
  end
  
  def create
    user = User.authenticate(params[:user][:username], params[:user][:password])
    if user==false
      flash[:warning]= "Kirjautuminen epäonnistui" 
      redirect_to :controller=> :sessions, :action => :index
      return
    end
    session[:user]=user.id
    flash[:success]="Sisäänkirjautuminen onnistui"
    redirect_to "/"
  end
  
  def destroy
    reset_session
    redirect_to :controller=> :sessions, :action => :index
  end
end
