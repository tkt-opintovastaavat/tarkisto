module Session

  def logged_in?
    unless current_user.nil?
      return true
    else
      return false
    end
  end

  def current_user
    unless session[:user_id].nil?
      User.find_by_id session[:user_id]
    else
      nil
    end
  end

  def access?
    unless logged_in?
      return false
    else
      if session[:access] > 0
        return true
      else
        return false
      end
    end
  end

  def moderator?
    unless logged_in?
      return false
    else
      if session[:access] > 1
        return true
      else
        return false
      end
    end
  end

  def admin?
    unless logged_in?
      return false
    else
      if session[:access] == 3
        return true
      else
        return false
      end
    end
  end

end
