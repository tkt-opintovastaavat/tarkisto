module Session

  def logged_in?
    not current_user.nil?
  end

  def current_user
    User.find_by_id session[:user_id] unless session[:user_id].nil?
  end

  def access?
    logged_in? and session[:access] > 0
  end

  def moderator?
    logged_in? and session[:access] > 1
  end

  def admin?
    logged_in? and session[:access] == 3
  end

end
