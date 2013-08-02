require 'spec_helper'

describe "user_steps/edit" do
  before(:each) do
    @user_step = assign(:user_step, stub_model(UserStep,
      :user_id => "MyString",
      :step_id => "MyString"
    ))
  end

  it "renders the edit user_step form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", user_step_path(@user_step), "post" do
      assert_select "input#user_step_user_id[name=?]", "user_step[user_id]"
      assert_select "input#user_step_step_id[name=?]", "user_step[step_id]"
    end
  end
end
