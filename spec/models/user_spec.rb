require 'rails_helper'

RSpec.describe User, :type => :model do

  it "should require a username" do
    User.new(:user => "").should_not be_valid
  end
  it "should allow empty password" do
    User.new(:user => "username", :password => "").should be_valid
  end

end
