require 'spec_helper'

describe "user_steps/index" do
  before(:each) do
    assign(:user_steps, [
      stub_model(UserStep,
        :user_id => "User",
        :step_id => "Step"
      ),
      stub_model(UserStep,
        :user_id => "User",
        :step_id => "Step"
      )
    ])
  end

  it "renders a list of user_steps" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "User".to_s, :count => 2
    assert_select "tr>td", :text => "Step".to_s, :count => 2
  end
end
