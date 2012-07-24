Warden::Strategies.add(:tarkisto, LdapAuth)

Devise.setup do |config|

  config.mailer_sender = "please-change-me-at-config-initializers-devise@example.com"

  require 'devise/orm/active_record'

  config.authentication_keys = [ :username ]
  config.case_insensitive_keys = [ :username ]
  config.strip_whitespace_keys = [ :username ]
  config.params_authenticatable = true
  config.http_authenticatable = false
  config.http_authenticatable_on_xhr = true
  config.timeout_in = 2.hours
  config.lock_strategy = :none
  config.unlock_keys = [ :username ]
  config.unlock_strategy = :none
  config.scoped_views = false
  config.default_scope = :user
  config.sign_out_all_scopes = true

  # ==> Navigation configuration
  # Lists the formats that should be treated as navigational. Formats like
  # :html, should redirect to the sign in page when the user does not have
  # access, but formats like :xml or :json, should return 401.
  #
  # If you have any extra navigational formats, like :iphone or :mobile, you
  # should add them to the navigational formats lists.
  #
  # The :"*/*" and "*/*" formats below is required to match Internet
  # Explorer requests.
  # config.navigational_formats = [:"*/*", "*/*", :html]

  # The default HTTP method used to sign out a resource. Default is :delete.
  config.sign_out_via = :get

  config.warden do |manager|
    manager.intercept_401 = false
    manager.default_strategies(:scope => :user).unshift :tarkisto
  end

end
