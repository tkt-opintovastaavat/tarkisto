class ImagesController < ApplicationController

     def create
          @image = Image.create(params[:image])

          respond_to do |format|
               format.js do
                    responds_to_parent do
                         render :update do |page|
                              page << "dataObject['questions'][#{params[:number]}]['images'].push(#{@image.id});"
                              page << "alert('upload successful')"
                         end
                    end
               end
          end
     end
end
