require 'rails_helper'

RSpec.describe "users/new", :type => :view do
  before(:each) do
    assign(:user, User.new(
      :user => "MyString",
      :password => "MyString",
      :count => 1
    ))
  end

  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do

      assert_select "input#user_user[name=?]", "user[user]"

      assert_select "input#user_password[name=?]", "user[password]"

      assert_select "input#user_count[name=?]", "user[count]"
    end
  end
end
