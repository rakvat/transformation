require 'spec_helper'

describe "steps/new" do
  before(:each) do
    assign(:step, stub_model(Step,
      :id => "MyString",
      :description => "MyString",
      :start_state => "MyString",
      :goal_state => "MyString"
    ).as_new_record)
  end

  it "renders new step form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", steps_path, "post" do
      assert_select "input#step_id[name=?]", "step[id]"
      assert_select "input#step_description[name=?]", "step[description]"
      assert_select "input#step_start_state[name=?]", "step[start_state]"
      assert_select "input#step_goal_state[name=?]", "step[goal_state]"
    end
  end
end
