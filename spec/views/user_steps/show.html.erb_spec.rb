require 'spec_helper'

describe "user_steps/show" do
  before(:each) do
    @user_step = assign(:user_step, stub_model(UserStep,
      :user_id => "User",
      :step_id => "Step"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/User/)
    rendered.should match(/Step/)
  end
end
