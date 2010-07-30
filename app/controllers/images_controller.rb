class ImagesController < ApplicationController
     def create
          @image = Question.find_by_id(params[:question][:id]).images.create(params[:image])
     end
end
