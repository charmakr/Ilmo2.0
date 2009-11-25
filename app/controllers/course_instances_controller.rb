class CourseInstancesController < ApplicationController
  def show
    @ci = CourseInstance.find_by_id(params[:id])
  end
end
