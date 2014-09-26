class TestapiController < ApplicationController

  # POST /TESTAPI/resetFixture
  def reset_fixture
    User.delete_all
    json = { "errCode" => 1 } 
    render status: 200, json: json
  end 

  # POST /TESTAPI/unitTests
  def unit_tests
    output = `#{'rspec'}`
    json = { "output" => output }
    render status: 200, json: json
  end 

end
