require 'rails_helper'

RSpec.describe TestapiController, :type => :controller do

  let(:valid_session) { {} }

  describe "POST reset_fixture" do
    it "should delete all rows from the table" do
      expect(User).to receive(:delete_all)
      post :reset_fixture, {}, valid_session
    end
  end

end
