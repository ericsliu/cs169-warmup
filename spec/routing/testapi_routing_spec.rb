require "rails_helper"

RSpec.describe UsersController, :type => :routing do
  describe "routing" do

    it "routes to #reset_fixture" do
      expect(:post => "/testapi/resetfixture").to route_to("testapi#reset_fixture")
    end
    it "does not use get for #add" do
      expect(:get => "/testapi/resetfixture").not_to be_routable
    end

    it "routes to #unit_tests" do
      expect(:post => "/testapi/unittests").to route_to("testapi#unit_tests")
    end
    it "does not use get for #unit_tests" do
      expect(:get => "/testapi/unittests").not_to be_routable
    end

  end
end
