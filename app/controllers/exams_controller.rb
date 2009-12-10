class ExamsController < ApplicationController
  
  def show
    @exam = Exam.find_by_id(params[:id])
    @u = @exam.users
  end
end
