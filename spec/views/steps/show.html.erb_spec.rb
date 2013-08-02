require 'spec_helper'

describe "steps/show" do
  before(:each) do
    @step = assign(:step, stub_model(Step,
      :code => "Code",
      :description => "Description",
      :start_state => "Start State",
      :goal_state => "Goal State"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Code/)
    rendered.should match(/Description/)
    rendered.should match(/Start State/)
    rendered.should match(/Goal State/)
  end
end
