class SessionController < ApplicationController
  
     def create
          user = User.authentication params[:session][:username], params[:session][:password]
          unless user.nil?
               session[:user_id] = user.id
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
