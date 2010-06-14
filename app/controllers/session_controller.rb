class SessionController < ApplicationController
  
     def create
          session[:user_id] = 1
          redirect_to root_url
     end
      
     def destroy
          session[:user_id] = nil
          redirect_to root_url
     end
  
end
