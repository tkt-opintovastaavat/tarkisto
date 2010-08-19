class Admin::UsersController < AdminController 

     active_scaffold :user do |config|
          config.label = "Käyttäjä"
          config.columns = [ :username, :email, :language, :access, :created_at, :updated_at ]
          list.sorting = {:username => 'ASC'}
          columns[:username].label = "Käyttäjänimi:"
          columns[:email].label = "Sähköposti:"
          columns[:language].label = "Kieli:"
          columns[:access].label = "Pääsy:"
          columns[:created_at].label = "Luotu:"
          columns[:updated_at].label = "Päivitetty:"
     end
                                                         
end
