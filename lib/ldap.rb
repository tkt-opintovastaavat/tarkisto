module LDAP
     def self.autheticate user, psw

#          return true

          ldap = Net::LDAP.new
          ldap.host = "ldap1.cs.helsinki.fi"
          ldap.base = "dc=cs,dc=helsinki,dc=fi"

          result = ldap.bind_as(
               :method => :simple_tls,
               :base => "uid=#{user},ou=People,dc=cs,dc=helsinki,dc=fi",
               :password => psw
          )
          if result
               return true
          else
               return false
          end
     end
end
