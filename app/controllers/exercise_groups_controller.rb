class ExerciseGroupsController < ApplicationController
  def show
    @ex = ExerciseGroup.find_by_id(params[:id])
  end
  
  def join 
    if params[:id]
    ExerciseGroup.find_by_id(params[:id]).join(User.find_by_id(session[:user]))
    end
    redirect_to :action=>:show, :id=>params[:id]  
  end
end
