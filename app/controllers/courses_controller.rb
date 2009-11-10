class CoursesController < ApplicationController
  def index
    @courses = Course.find(:all)
  end

end
