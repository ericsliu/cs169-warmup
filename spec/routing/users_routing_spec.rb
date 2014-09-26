require "rails_helper"

RSpec.describe UsersController, :type => :routing do
  describe "routing" do

    it "routes to #add" do
      expect(:post => "/users/add").to route_to("users#add")
    end
    it "does not use get for #add" do
      expect(:get => "/users/add").not_to be_routable
    end

    it "routes to #login" do
      expect(:post => "/users/login").to route_to("users#login")
    end
    it "does not use get for #login" do
      expect(:get => "/users/login").not_to be_routable
    end

  end
end
