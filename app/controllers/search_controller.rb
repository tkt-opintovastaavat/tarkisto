class SearchController < ApplicationController

     def show
          @p = params[:query]
          @result = Course.search(params[:query])
     end
     
     # siirrä tämä kurssi-kontrolleriin
     def courses
          @courses_json = format_json(Course.search(params[:term]))
          respond_to do |format|
               format.json{render :json => @courses_json}
          end
     end
     
     # siirrä tämä kurssi-kontrolleriin
     protected
     def format_json courses
          courses.collect{|course| {:id => course.id, :value => course.name, :label => course.name}}
     end

end
