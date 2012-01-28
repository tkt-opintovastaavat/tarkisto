class SearchController < ApplicationController

  def show
    @p = params[:query]
    @result = Course.search(params[:query])
  end

end
