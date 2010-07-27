class QuestionsController < ApplicationController

     before_filter :_get_exam

     def show
          @question = @exam.questions.find_by_id params[:id]

          respond_to do |format|
               format.html { render :layout => false }
          end
     end

     def create
          @question = @exam.questions.new
          @question.save(false)

          respond_to do |format|
               format.json { render :json => {:id => @question.id} }
          end
     end

     def destroy
          @question = @exam.questions.find_by_id params[:id]
          @question.destroy

          respond_to do |format|
               format.json { render :json => {} }
          end
     end

     def _get_exam
          @exam = Course.find_by_id(params[:course_id]).exams.unpublished.find_by_id(params[:exam_id])
     end

end
