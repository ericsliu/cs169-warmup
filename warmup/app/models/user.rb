class User < ActiveRecord::Base

  SUCCESS = 1
  ERR_BAD_CREDENTIALS = -1
  ERR_USER_EXISTS = -2
  ERR_BAD_USERNAME = -3
  ERR_BAD_PASSWORD = -4

  validates_presence_of :user
  validates_uniqueness_of :user
  validates_length_of :user, :maximum => 128
  validates_length_of :password, :maximum => 128

  def self.add(name, pw)
    user = User.new
    user.username = name
    user.password = pw
    user.count = 1
    if user.save
      return SUCCESS
    else
      if name.length > 128
        return ERR_BAD_USERNAME
      elsif pw.length > 128
        return ERR_BAD_PASSWORD
      else
        return ERR_USER_EXISTS
    end
  end

end
