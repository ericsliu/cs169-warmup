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
    split_output = output.split("\n")
    results = split_output[split_output.length - 1]
    counts = results.split(", ")
    totalTests = counts[0].split(" ")[0].to_i
    nrFailed = counts[1].split(" ")[0].to_i
    json = { "output" => output, "totalTests" => totalTests, "nrFailed" => nrFailed }
    render status: 200, json: json
  end 

end
