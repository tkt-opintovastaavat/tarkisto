module LDAP

     def self.authenticate username, password

          config = LDAP_CONFIG.authentication

          unless config['required']
               return true 
          end

          ldap = Net::LDAP.new(
               :host => config['host'],
               :base => config['base'], 
               :port=> 636, 
               :encryption => :simple_tls
          )
          ldap.authenticate "uid=#{username},#{config['base']}", password

          begin
               result = ldap.bind
          rescue
               return false
          end

          if result
               return true
          else
               return false
          end
     end

     def self.departmentcheck username

          config = LDAP_CONFIG.department

          unless config['required']
               return true 
          end

          ldap = Net::LDAP.new
          ldap.host = config['host']
          ldap.base = config['base']

          begin
               result = ldap.search :filter => "uid=#{username}"
          rescue
               return false
          end

          if result.count == 1
               return true
          else
               return false
          end
     end

end
