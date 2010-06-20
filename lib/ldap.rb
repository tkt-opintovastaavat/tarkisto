module LDAP

     def self.authenticate user, psw

          config = LDAP_CONFIG.authentication

          unless config['required']
               return true 
          end

          ldap = Net::LDAP.new
          ldap.host = config['host']
          ldap.base = config['base']

          begin
               result = ldap.bind_as(
                    :method => :simple_tls,
                    :base => "uid=#{user},#{config['bind_dn']}",
                    :password => psw
               )
          rescue
               return false
          end

          if result
               return true
          else
               return false
          end
     end
end
