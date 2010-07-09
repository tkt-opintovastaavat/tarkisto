class QuestionsController < ApplicationController

     def show
          @question = Course.find_by_id(params[:course_id]).exams.unpublished.find_by_id(params[:exam_id]).questions.find_by_id params[:id]

          respond_to do |format|
               format.html { render :layout => false }
          end
     end

     def create
          @question = Course.find_by_id(params[:course_id]).exams.unpublished.find_by_id(params[:exam_id]).questions.new
          @question.save(false)

          respond_to do |format|
               format.json { render :json => {:id => @question.id} }
          end
     end

end
