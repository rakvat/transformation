require 'spec_helper'

describe "user_states/new" do
  before(:each) do
    assign(:user_state, stub_model(UserState,
      :user_id => "MyString",
      :state_id => "MyString"
    ).as_new_record)
  end

  it "renders new user_state form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", user_states_path, "post" do
      assert_select "input#user_state_user_id[name=?]", "user_state[user_id]"
      assert_select "input#user_state_state_id[name=?]", "user_state[state_id]"
    end
  end
end
