class CoursesController < ApplicationController
  def index
    @courses = Course.find(:all)
    @users = User.new
  end
  def show
    @courses = Course.find(params[:id])   
  end

end
