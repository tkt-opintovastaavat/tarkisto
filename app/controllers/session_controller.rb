class SessionController < ApplicationController
  
     def create
          user = User.authetication params[:session][:username], params[:session][:password]
          unless user.nil?
               session[:user_id] = user.id
          end
          redirect_to root_url
     end
     
     def destroy
          session[:user_id] = nil
          redirect_to root_url
     end
  
end
