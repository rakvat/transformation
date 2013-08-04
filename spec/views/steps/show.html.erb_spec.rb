require 'spec_helper'

describe "steps/show" do
  before(:each) do
    @step = assign(:step, stub_model(Step,
      :code => "Code",
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Code/)
    rendered.should match(/Description/)
  end
end
