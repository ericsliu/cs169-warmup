class User < ActiveRecord::Base

  SUCCESS = 1

  validates_presence_of :user
  validates_uniqueness_of :user
  validates_length_of :user, :maximum => 128
  validates_length_of :password, :maximum => 128

  def self.add(name, pw)
    user = User.new
    user.username = name
    user.password = pw
    user.count = 1
    user.save
  end

end
