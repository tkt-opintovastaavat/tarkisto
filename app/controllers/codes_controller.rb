class CodesController < ApplicationController

     def create
          @code = CodeSnippet.create! :text => params[:code]
          render :json => {'id' => @code.id}
     end

     def show
          @code = CodeSnippet.find_by_id params[:id]
          render :json => {'text' => @code.text}
     end

end
