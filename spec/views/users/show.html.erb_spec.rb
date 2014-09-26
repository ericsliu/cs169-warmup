require 'rails_helper'

RSpec.describe "users/show", :type => :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :user => "User",
      :password => "Password",
      :count => 1
    ))
  end

#  it "renders attributes in <p>" do
#    render
#    expect(rendered).to match(/User/)
#    expect(rendered).to match(/Password/)
#    expect(rendered).to match(/1/)
#  end
end
