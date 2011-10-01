class ApplicationController < ActionController::Base

  helper :all # include all helpers, all the time
  #protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password

  include Session
  include SslRequirement

  protected

  def ssl_required?
    !Rails.env.development?
  end

end
