require 'spec_helper'

describe "steps/index" do
  before(:each) do
    assign(:steps, [
      stub_model(Step,
        :code => "Code",
        :description => "Description",
        :start_state => "Start State",
        :goal_state => "Goal State"
      ),
      stub_model(Step,
        :code => "Code",
        :description => "Description",
        :start_state => "Start State",
        :goal_state => "Goal State"
      )
    ])
  end

  it "renders a list of steps" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Code".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Start State".to_s, :count => 2
    assert_select "tr>td", :text => "Goal State".to_s, :count => 2
  end
end
