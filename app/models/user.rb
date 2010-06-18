require 'ldap'

class User < ActiveRecord::Base

     def self.authentication username, password
          if LDAP.authenticate username, password
               user = User.find_by_username username
               if user.nil?
                    user = User.create :username => username
               end
               return user
          end
     end

     
end
