require 'rails_helper'

RSpec.describe "users/edit", :type => :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :user => "MyString",
      :password => "MyString",
      :count => 1
    ))
  end

#  it "renders the edit user form" do
#    render
#
#    assert_select "form[action=?][method=?]", user_path(@user), "post" do
#
#      assert_select "input#user_user[name=?]", "user[user]"
#
#      assert_select "input#user_password[name=?]", "user[password]"
#
#      assert_select "input#user_count[name=?]", "user[count]"
#    end
#  end
end
