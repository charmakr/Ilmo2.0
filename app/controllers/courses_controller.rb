class CoursesController < ApplicationController
  def index
    @courses = Course.find(:all)
  end
  def show
    @courses = Course.find(:id)   
  end

end
