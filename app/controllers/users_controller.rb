class UsersController < ApplicationController
  skip_before_filter :authentication_required, :only => [:create, :new]
  
  
  def index
    @u = User.find_by_id(session[:user])
  end
  
  def show 
    @u = User.find_by_id(session[:user]) 
    redirect_to :index
  end
  
  def edit
    @user = User.find_by_id(session[:user]) 
    @user1 = User.new
    @exgs = @user.exercise_groups
  end
  
  def new
    @user = User.new
  end
  
  def update
    @user = User.find_by_id(session[:user])
    if params[:commit]=="Poista käyttäjätili"
      if(User.authenticate(@user.username,params[:user][:password]))
        render :template => "users/confirm", :layout=>true
        return
      end
      flash[:warning]="Väärä salasana"
      render  :action=>:edit 
      return
    end
    if (params[:commit]=="Vaihda salasana")
      if(User.authenticate(@user.username,params[:password_vanha]))
        @user1 = @user
        @user1.password = params[:password]
        @user1.password_confirmation= params[:password_confirmation]
        @user1.save
        flash[:warning]=""
        render  :action=>:edit 
        return
      end
      flash[:warning]="Väärä salasana"
      render  :action=>:edit 
      return
    end
    
    if(User.authenticate(@user.username,params[:user][:password]))     
      if @user.update_attributes(params[:user])
        flash[:success]="Tiedot päivitetty"
        redirect_to edit_user_url(params[:user])
        return
      end
      render  :action=>:edit 
      return
    end
    flash[:warning]="Väärä salasana"
    render  :action=>:edit 
  end
  
  
  
  def create
    @user = User.new(params[:user])
    
    if @user.save
      flash[:success]="Käyttäjän luonti onnistui"
      redirect_to :controller =>"sessions", :action=> "index"
      return
    end
    render  :action=>:new  
    return
          
  end
  
  def destroy
    User.find_by_id(session[:user]).delete
    flash[:success]="Käyttäjätilisi on nyt poistettu"
    redirect_to :controller=>:sessions, :action=>:destroy
  end
  
  def like_newsfeed
    if params[:id]
      begin
        Newsfeed.find_by_id(params[:id]).like(User.find_by_id(session[:user]))
      rescue 
        flash[:warning]="Ongelma"
        redirect_to "/"  and return
      end
    end
    redirect_to "/" 
  end
end
