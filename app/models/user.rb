class User < ActiveRecord::Base

     has_many :attendances

     def self.authentication username, password
          return nil if username.nil? or username.empty?
          include LDAP
          if LDAP.authenticate(username, password) && LDAP.departmentcheck(username)
               user = User.find_by_username username
               if user.nil?
                    user = User.create :username => username
               end
               return user
          end
     end

end
