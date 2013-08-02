require 'spec_helper'

describe "user_states/edit" do
  before(:each) do
    @user_state = assign(:user_state, stub_model(UserState,
      :user_id => "MyString",
      :state_id => "MyString"
    ))
  end

  it "renders the edit user_state form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", user_state_path(@user_state), "post" do
      assert_select "input#user_state_user_id[name=?]", "user_state[user_id]"
      assert_select "input#user_state_state_id[name=?]", "user_state[state_id]"
    end
  end
end
