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

     def access
       @access ||= tko_aly_auth
     end

     private

     def tko_aly_auth
       if TKOaly::Auth.tarkisto_admin? self.username
         3
       else
         1 # 0 = banned, 1 = standard access , 2 = moderator access,  3 = administrator access
       end
     end

end
