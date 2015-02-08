require_relative 'spec_helper'


describe "Relationships" do
  it "tests for users prices" do
    # get '/'
    test_user = User.find(1)
	test_user.prices[0].cost.to eq(200000)

  end
end

