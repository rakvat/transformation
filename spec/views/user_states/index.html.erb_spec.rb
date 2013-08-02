require 'spec_helper'

describe "user_states/index" do
  before(:each) do
    assign(:user_states, [
      stub_model(UserState,
        :user_id => "User",
        :state_id => "State"
      ),
      stub_model(UserState,
        :user_id => "User",
        :state_id => "State"
      )
    ])
  end

  it "renders a list of user_states" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "User".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
  end
end
