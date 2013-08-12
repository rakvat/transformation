require 'spec_helper'

describe "steps/new" do
  before(:each) do
    assign(:step, stub_model(Step,
      :code => "MyString",
      :description => "MyString"
    ).as_new_record)
  end

  it "renders new step form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", steps_path, "post" do
      assert_select "input#step_code[name=?]", "step[code]"
      assert_select "input#step_description[name=?]", "step[description]"
    end
  end
end
