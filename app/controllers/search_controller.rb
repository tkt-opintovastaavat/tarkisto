class SearchController < ApplicationController

  skip_before_filter :authenticate_user!

  def show
    @p = params[:query]
    @result = Course.search(params[:query])
  end

end
