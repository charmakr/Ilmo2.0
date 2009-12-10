class ExamsController < ApplicationController
  
  def show
    @exam = Exam.find_by_id(params[:id])
    @u = @exam.users
  end
  
  def join
    if params[:id]
      begin
        Exam.find_by_id(params[:id]).take_part(User.find_by_id(session[:user]))
      rescue 
        flash[:warning]="Ongelma"
        redirect_to course_exam_path(Exam.find_by_id(params[:id]).course,Exam.find_by_id(params[:id]))  and return
      end
    end
    redirect_to course_exam_path(Exam.find_by_id(params[:id]).course,Exam.find_by_id(params[:id]))
  end
 
end
