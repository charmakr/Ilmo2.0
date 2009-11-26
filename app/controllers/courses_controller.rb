class CoursesController < ApplicationController
  def index
    @courses = Course.down
  end
  def show
    @courses = Course.find(params[:id])   
  end

end
