class User < ActiveRecord::Base

  devise :database_authenticatable, :trackable, :lockable

  attr_accessible :username, :password, :remember_me

  attr_accessor :encrypted_password

  has_many :attendances

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
