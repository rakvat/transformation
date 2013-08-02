require 'spec_helper'

describe "user_states/show" do
  before(:each) do
    @user_state = assign(:user_state, stub_model(UserState,
      :user_id => "User",
      :state_id => "State"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/User/)
    rendered.should match(/State/)
  end
end
