class SearchController < ApplicationController

     def show
          courses = [
               Hash["key", "tira", "name", "Tietorakenteet", "course_id", 2],
               Hash["key", "lama", "name", "Laskennan mallit", "course_id", 1],
               Hash["key", "ohpe", "name", "Ohjelmoinnin perusteet", "course_id", 3]
          ]
          @q = params[:query]
          # raise courses.first["key"].inspect
          @result = courses.select {|value| value["key"] == @q }
     end

end
