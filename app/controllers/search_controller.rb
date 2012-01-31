class SearchController < ApplicationController

  skip_before_filter :authenticate_user!

  skip_authorization_check

  def show
    @p = params[:query]
    @result = Course.search(params[:query])
  end

end
