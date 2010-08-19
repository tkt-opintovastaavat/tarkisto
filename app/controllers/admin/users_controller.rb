class Admin::UsersController < AdminController 

     active_scaffold :user do |config|
          config.label = "User"
          config.columns = [ :username, :email, :language, :access ]
          list.sorting = {:username => 'ASC'}
          columns[:username].label = "Username: #"
          columns[:email].label = "Email: #"
          columns[:language].label = "Language: #"
          columns[:access].label = "Access: #"
     end
                                                         
end
