require 'ldap'

class User < ActiveRecord::Base

     def self.authetication username, password
          if LDAP.autheticate username, password
               user = User.find_by_username username
               if user.nil?
                    user = User.create :username => username
               end
               return user
          end
     end

     
end
