class ExerciseGroupsController < ApplicationController
  def show
    @ex = ExerciseGroup.find_by_id(params[:id])
  end

end
