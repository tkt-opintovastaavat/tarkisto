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
          courses.collect do |course|
               label = course.name
               if label.size - 3 > 60
                    label = "#{label[0...55]}..."
               end
               {:id => course.id, :value => course.name, :label => label}
          end
     end

end
