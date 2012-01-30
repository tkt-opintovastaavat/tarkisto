class LdapAuth < Devise::Strategies::Authenticatable

  attr_accessor :username

  def authenticate!
    if valid_password? and valid_username? and valid_account?
      success!(find_user)
    elsif !halted?
      fail(:invalid)
    end
  end

  private

  def valid_username?
    @username = authentication_hash[:username]
    not @username.blank?
  end

  def valid_account?
    uni_student?(username, password) and cs_student?(username)
  end

  def uni_student?(username, password)
    LDAP.authenticate(username, password)
  end

  def cs_student?(username)
    LDAP.departmentcheck(username)
  end

  def find_user
    User.find_by_username(username) || User.create(:username => username)
  end

  class LDAP

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

end
