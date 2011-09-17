class Admin::AdminController < AdminController
  include Session

  before_filter :check_access

  def index
  end

  def check_access
    unless admin?
      redirect_to :root
    end
  end

end
