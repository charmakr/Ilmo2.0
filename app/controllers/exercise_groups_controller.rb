class ExerciseGroupsController < ApplicationController
  def show
    @ex = ExerciseGroup.find_by_id(params[:id])
  end
  
  def join 
    if params[:id]
      begin
        ExerciseGroup.find_by_id(params[:id]).join(User.find_by_id(session[:user]))
      rescue
        flash[:warning]="Ryhmä täynnä"
        redirect_to :action=>:show, :id=>params[:id]  and return
      end
    end
    redirect_to :action=>:show, :id=>params[:id]  
  end
end
