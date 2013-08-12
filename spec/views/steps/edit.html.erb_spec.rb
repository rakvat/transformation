require 'spec_helper'

describe "steps/edit" do
  before(:each) do
    @step = assign(:step, stub_model(Step,
      :code => "MyString",
      :description => "MyString"
    ))
  end

  it "renders the edit step form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", step_path(@step), "post" do
      assert_select "input#step_code[name=?]", "step[code]"
      assert_select "input#step_description[name=?]", "step[description]"
    end
  end
end
