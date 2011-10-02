class ApplicationController < ActionController::Base

  helper :all # include all helpers, all the time
  #protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password

  include Session

  before_filter :redirect_to_https

  def redirect_to_https
    redirect_to :protocol => "https://" unless (request.ssl? || local_request?)
  end

end
