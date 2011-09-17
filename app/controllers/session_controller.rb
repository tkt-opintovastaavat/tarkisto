class SessionController < ApplicationController

  def create
    admin = ["azlauril", "tniemela", "thusu", "ptkarjal", "aekuosma", "saada"] #demo use
    user = User.authentication params[:session][:username], params[:session][:password]
    unless user.nil?
      session[:user_id] = user.id
      if admin.include?(user.username)
        session[:access] = 3
      else
        session[:access] = 1 # 0 = banned, 1 = standard access , 2 = moderator access,  3 = administrator access
      end
    else
      flash[:session_error] = I18n.t('pages.session.errors.login_failed')
    end
    redirect_to root_url
  end

  def destroy
    session[:user_id] = nil
    flash[:session_notification] = I18n.t('pages.session.notifications.logout')
    redirect_to root_url
  end

end
