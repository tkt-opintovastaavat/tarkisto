class ImagesController < ApplicationController

     def create
          @image = Image.create(params[:image])
          position = params[:number].to_i-1
          respond_to do |format|
               format.js do
                    responds_to_parent do
                         render :update do |page|
                              page << "dataObject.questions[#{position}].images.push(#{@image.id});"
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

     def getImageURL
          image = Image.find_by_id(params[:id])
          unless image.nil?
               if (request.xhr?)
                    render :text => "/public/question_images/#{params[:id]}/web_#{image.question_image_file_name}".to_s
               else
                    render :html => "/public/question_images/#{params[:id]}/web_#{image.question_image_file_name}".to_s
               end
          else
               return ""
          end
     end
     def getImageFileName          
          image = Image.find_by_id(params[:id])
          unless image.nil?
               if (request.xhr?)
                    render :text => image.question_image_file_name.to_s
               else
                    render :html => image.question_image_file_name.to_s
               end
          else
               return ""
          end
     end
end
