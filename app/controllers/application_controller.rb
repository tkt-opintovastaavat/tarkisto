class ApplicationController < ActionController::Base

  helper :all # include all helpers, all the time
  #protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password

  include Session

  enforce_protocols do |config|
    config.parameter = :ssl
    config.secure_session = true
    config.enable_ssl = true
  end

end
