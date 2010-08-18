class ImagesController < ApplicationController

     def create
          @image = Image.create(params[:image])

          respond_to do |format|
               format.js do
                    responds_to_parent do
                         render :update do |page|
                              page << "dataObject.questions[#{params[:number]}].images.push(#{@image.id});"
                              page << "dataObject.modified = true;"
                              page << "alert('upload successful')"
                         end
                    end
               end
          end
     end

     def formula
          @image = Image.create! :image_url => URI.encode("http://chart.apis.google.com/chart?cht=tx&chl=#{params[:formula]}")
          respond_to do |format|
               format.json { render :json => {'id' => @image.id} }
          end
     end

     #@image = Question.find_by_id(params[:question][:id]).images.create(params[:image])
end