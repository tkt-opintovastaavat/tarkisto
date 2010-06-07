class SearchController < ApplicationController

     def show
          @q = params[:query]
     end

end
