class UsersController < ApplicationController
  def index   
  end
  
  def show    
  end
  
  def create
    u = User.find_by_id(session[:user])
    
   if params[:user][:password3]!=params[:user][:password2]
      flash[:warning]= "Uudet salasanat ei täsmää" 
      redirect_to :controller=>:users, :action=>:index 
      return
    end
    
    ok = User.authenticate(u.username, params[:user][:password])
    if ok
      u.first_name = params[:user][:first_name]
      u.surname = params[:user][:first_name]
      u.student_number = params[:user][:first_name]
      if params[:user][:password2]==""||params[:user][:password3]==""
        flash[:success]="Tiedot päivitetty, Salasanaa ei vaihdettu"
        redirect_to :controller=>:users, :action=>:index
        return  
      end
      flash[:success]="Tiedot päivitetty, Salasanaa vaihdettu"
      redirect_to :controller=>:users, :action=>:index
      return
    end
    if !ok
      flash[:warning]="Väärä salasana"
    end
  end
end
