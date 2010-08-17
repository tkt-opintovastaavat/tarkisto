class CodesController < ApplicationController

     def create
          @code = CodeSnippet.create :text => params[:code]
          render :json => {'id' => @code.id}
     end

end
