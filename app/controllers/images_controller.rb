class ImagesController < ApplicationController

  def create
    @image = Image.create! params[:image]
    position = params[:number].to_i-1
    respond_to do |format|
      format.js do
        responds_to_parent do
          render :update do |page|
            page << "dataObject.questions[#{position}].images.push(#{@image.id});"
            page << "dataObject.modified = true;"
            page << "populateAttachmentList()"
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

end
