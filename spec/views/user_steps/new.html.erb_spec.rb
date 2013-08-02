require 'spec_helper'

describe "user_steps/new" do
  before(:each) do
    assign(:user_step, stub_model(UserStep,
      :user_id => "MyString",
      :step_id => "MyString"
    ).as_new_record)
  end

  it "renders new user_step form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", user_steps_path, "post" do
      assert_select "input#user_step_user_id[name=?]", "user_step[user_id]"
      assert_select "input#user_step_step_id[name=?]", "user_step[step_id]"
    end
  end
end
