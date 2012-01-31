ActiveAdmin.setup do |config|

  config.site_title = "Tarkisto"
  config.site_title_link = "/"
  config.authentication_method = :authenticate_user!
  config.current_user_method = :current_user
  config.logout_link_path = :destroy_user_session_path
  # config.logout_link_method = :get
  config.before_filter :authorize_admin_access
  # config.register_stylesheet 'my_stylesheet.css'
  # config.register_javascript 'my_javascript.js'

end
