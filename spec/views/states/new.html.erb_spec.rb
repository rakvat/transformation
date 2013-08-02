require 'spec_helper'

describe "states/new" do
  before(:each) do
    assign(:state, stub_model(State,
      :spread => 1,
      :establ => 1,
      :build => 1,
      :happy => 1,
      :time => 1,
      :transformers => 1
    ).as_new_record)
  end

  it "renders new state form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", states_path, "post" do
      assert_select "input#state_spread[name=?]", "state[spread]"
      assert_select "input#state_establ[name=?]", "state[establ]"
      assert_select "input#state_build[name=?]", "state[build]"
      assert_select "input#state_happy[name=?]", "state[happy]"
      assert_select "input#state_time[name=?]", "state[time]"
      assert_select "input#state_transformers[name=?]", "state[transformers]"
    end
  end
end
