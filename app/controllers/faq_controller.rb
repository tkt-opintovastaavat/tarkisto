class FaqController < ApplicationController

  skip_before_filter :authenticate_user!

  skip_authorization_check

  def show
  end

end
