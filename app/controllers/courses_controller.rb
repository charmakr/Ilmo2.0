class CoursesController < ApplicationController
  def index
    @newsfeed = Newsfeed.all
    @courses = Course.down
    respond_to do |format|
      format.html
      format.rss
    end
  end
  def show
    @courses = Course.find(params[:id])   
  end

end
