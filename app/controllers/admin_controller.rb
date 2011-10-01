class AdminController < ApplicationController
  include Session

  before_filter :check_access

  def check_access
    unless admin?
      redirect_to :root
    end
  end

end
