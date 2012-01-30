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

  # ==> Configuration for :timeoutable
  # The time you want to timeout the user session without activity. After this
  # time the user will be asked for credentials again. Default is 30 minutes.
  # config.timeout_in = 30.minutes

  # ==> Configuration for :lockable
  # Defines which strategy will be used to lock an account.
  # :failed_attempts = Locks an account after a number of failed attempts to sign in.
  # :none            = No lock strategy. You should handle locking by yourself.
  # config.lock_strategy = :failed_attempts

  # Defines which key will be used when locking and unlocking an account
  config.unlock_keys = [ :username ]

  # Defines which strategy will be used to unlock an account.
  # :email = Sends an unlock link to the user email
  # :time  = Re-enables login after a certain amount of time (see :unlock_in below)
  # :both  = Enables both strategies
  # :none  = No unlock strategy. You should handle unlocking by yourself.
  # config.unlock_strategy = :both

  # Number of authentication tries before locking an account if lock_strategy
  # is failed attempts.
  # config.maximum_attempts = 20

  # Time interval to unlock the account if :time is enabled as unlock_strategy.
  # config.unlock_in = 1.hour

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
