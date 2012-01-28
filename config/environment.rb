# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')
require 'ostruct'

Rails::Initializer.run do |config|

  config.time_zone = 'UTC'
  config.action_controller.allow_forgery_protection = false
  config.i18n.default_locale = :fi

end
