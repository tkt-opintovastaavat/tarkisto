# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
#RAILS_GEM_VERSION = '2.3.5' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|

     config.gem "haml"
     config.gem "compass", :version => ">=0.10.1"
     config.gem "net-ldap", :lib => 'net/ldap'
     config.gem "pdf-writer", :lib => 'pdf/writer', :version => ">=1.1.0"
     config.gem "tabs_on_rails", :source => "http://gemcutter.org" 

     config.time_zone = 'UTC'

     config.i18n.default_locale = :fi

end
