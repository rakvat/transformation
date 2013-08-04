require 'spec_helper'

describe "steps/index" do
  before(:each) do
    assign(:steps, [
      stub_model(Step,
        :code => "Code",
        :description => "Description"
      ),
      stub_model(Step,
        :code => "Code",
        :description => "Description"
      )
    ])
  end

  it "renders a list of steps" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Code".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
