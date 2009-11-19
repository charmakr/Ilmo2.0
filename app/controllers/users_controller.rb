class UsersController < ApplicationController
  def index
    @u = User.find_by_id(session[:user])
  end
  
  def show
   
    @u = User.find_by_id(session[:user]) 
    redirect_to :index
  end
  
  def create
    u = User.find_by_id(session[:user])
    
    begin 
      User.authenticate(u.username, params[:user][:password])
    rescue
      flash[:warning]="Väärä salasana, tietoja ei tallenettu"
      redirect_to :controller=>:users, :action=>:index
      return  
    end
    
    if params[:commit]=="Päivitä"
      u.first_name = params[:user][:first_name]
      u.surname = params[:user][:surname]
      u.student_number = params[:user][:student_number]
      u.save
      flash[:success]="Tiedot päivitetty"
      redirect_to :controller=>:users, :action=>:index
      return        
    end
    
    if params[:commit]=="Vaihda salasana"
      warning = User.checkInformation_on_update(params[:user])
      if warning!=nil
        flash[:warning]=warning
        redirect_to :controller=>:users, :action=>:index
        return
      end   
      u.password = params[:user][:password2]
      u.save
      flash[:success]="Salasanaa vaihdettu"
      redirect_to :controller=>:users, :action=>:index
      return
    end
    if params[:commit]=="Poista käyttäjätili"
      render :template => "users/confirm", :layout=>true

    end
        
  end
  
  def destroy
    User.find_by_id(session[:user]).delete
    flash[:success]="Käyttäjätilisi on nyt poistettu"
    redirect_to :controller=>:sessions, :action=>:destroy
  end
end
