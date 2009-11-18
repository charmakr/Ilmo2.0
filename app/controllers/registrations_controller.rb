class RegistrationsController < ApplicationController
  skip_before_filter :authentication_required
  def index
    
  end
  def create
    if params[:user][:password]!=params[:user][:password2]
      flash[:warning]= "Salasanat ei täsmää" 
      redirect_to :controller=>:registrations, :action=>:index  
      return
    end
     if params[:user][:username]=="" || params[:user][:password]==""
       flash[:warning]="Tyhjiä kenttiä"
       redirect_to :controller=>:registrations, :action=>:index 
      return
     end
    ok = User.register(params[:user][:username], params[:user][:password])
    if ok
      flash[:success]="Käyttäjän luonti onnistui"
      redirect_to :controller=>:sessions, :action=>:index  
      return
    end
    if !ok
      flash[:warning]="Käyttäjänimi käytössä"
      redirect_to :controller=>:registrations, :action=>:index  
      return
    end
    
  end
end
