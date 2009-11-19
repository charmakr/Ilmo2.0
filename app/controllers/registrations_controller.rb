class RegistrationsController < ApplicationController
  skip_before_filter :authentication_required
  def index
    
  end
  def create

    warning = User.checkInformation_on_registration(params[:user])
    if warning!=nil
      flash[:warning]=warning
      redirect_to :controller=>:registrations, :action=>:index
      return
    end    
    ok = User.register(params[:user][:username], params[:user][:password2])
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
