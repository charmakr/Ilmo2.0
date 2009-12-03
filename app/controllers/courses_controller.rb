class CoursesController < ApplicationController
  def index
    @newsfeed = Newsfeed.all
    @courses = Course.down
  end
  def show
    @courses = Course.find(params[:id])   
  end

end
