class User < ActiveRecord::Base

  SUCCESS = 1
  ERR_BAD_CREDENTIALS = -1
  ERR_USER_EXISTS = -2
  ERR_BAD_USERNAME = -3
  ERR_BAD_PASSWORD = -4
  MAX_PASSWORD_LENGTH = 128
  MAX_USERNAME_LENGTH = 128

  validates_presence_of :user
  validates_uniqueness_of :user
  validates_length_of :user, :maximum => MAX_USERNAME_LENGTH
  validates_length_of :password, :maximum => MAX_PASSWORD_LENGTH

  def self.add(name, pw)
    user = User.new
    user[:user] = name
    user[:password] = pw
    user[:count] = 1
    if user.save
      return SUCCESS
    else
      if name.nil? || name.length > MAX_USERNAME_LENGTH
        return ERR_BAD_USERNAME
      elsif !pw.nil? && pw.length > MAX_PASSWORD_LENGTH
        return ERR_BAD_PASSWORD
      else
        return ERR_USER_EXISTS
      end
    end
  end

  def self.login(name, pw)
    user = self.find_by(user: name)
    user[:count] += 1
    user.save
  end

end
